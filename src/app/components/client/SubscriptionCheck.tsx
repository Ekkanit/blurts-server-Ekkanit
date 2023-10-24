/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

"use client";

import { useSession } from "next-auth/react";
import { useEffect } from "react";
import { hasPremium } from "../../functions/universal/user";

export const SubscriptionCheck = () => {
  const { data: session, update } = useSession();

  useEffect(() => {
    async function updateSession() {
      await update();
    }

    if (!hasPremium(session?.user)) {
      void updateSession();
    }

    // This should only run once per page load - `update` will always appear to be changed.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return <></>;
};
