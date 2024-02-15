/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import { NextRequest, NextResponse } from "next/server";
import { authOptions } from "../../../../utils/auth";
import { getServerSession } from "next-auth";
import { logger } from "../../../../../functions/server/logging";
import {
  BreachBulkResolutionRequest,
  Subscriber,
} from "../../../../../deprecated/(authenticated)/user/breaches/breaches.js";
import { getBreaches } from "../../../../../functions/server/getBreaches";
import { getAllEmailsAndBreaches } from "../../../../../../utils/breaches";
import {
  getSubscriberByFxaUid,
  setBreachResolution,
} from "../../../../../../db/tables/subscribers";

export async function PUT(req: NextRequest): Promise<NextResponse> {
  const session = await getServerSession(authOptions);
  if (
    !session?.user?.subscriber ||
    typeof session?.user?.subscriber.fxa_uid !== "string"
  ) {
    return new NextResponse(
      JSON.stringify({ success: false, message: "Unauthenticated" }),
      { status: 401 },
    );
  }

  try {
    const subscriber: Subscriber = await getSubscriberByFxaUid(
      session.user.subscriber.fxa_uid,
    );
    const allBreaches = await getBreaches();
    const { dataType: dataTypeToResolve }: BreachBulkResolutionRequest =
      await req.json();

    const { verifiedEmails } = await getAllEmailsAndBreaches(
      subscriber,
      allBreaches,
    );

    const currentBreachResolution = subscriber.breach_resolution || {}; // get this from existing breach resolution if available

    for (const verifiedEmail of verifiedEmails) {
      const currentEmail = verifiedEmail.email;
      for (const currentBreach of verifiedEmail.breaches) {
        const currentBreachDataTypes = currentBreach.DataClasses;

        if (currentBreachDataTypes?.includes(dataTypeToResolve)) {
          const breachId = currentBreach.Id;
          const currentResolutionsChecked =
            currentBreachResolution[currentEmail]?.[breachId]
              ?.resolutionsChecked ?? [];

          if (!currentResolutionsChecked.includes(dataTypeToResolve)) {
            currentResolutionsChecked.push(dataTypeToResolve);
          }

          currentBreachResolution[currentEmail] = {
            ...(currentBreachResolution[currentEmail] || {}),
            ...{
              [breachId]: {
                resolutionsChecked: currentResolutionsChecked,
              },
            },
          };
        }
      }
    }

    // set useBreachId to mark latest version of breach resolution
    // without this line, the get call might assume recency index
    currentBreachResolution.useBreachId = true;

    const updatedSubscriber = await setBreachResolution(
      subscriber,
      currentBreachResolution,
    );

    return NextResponse.json({
      success: true,
      breachResolutions: updatedSubscriber.breach_resolution,
    });
  } catch (e) {
    logger.error(e);
    return NextResponse.json({ success: false }, { status: 500 });
  }
}
