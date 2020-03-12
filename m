Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5E1183C15
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 23:12:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgCLWMQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 18:12:16 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36773 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgCLWMQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:16 -0400
Received: by mail-pg1-f195.google.com with SMTP id c7so3767012pgw.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vXhYKsEgtOtgmS2aSTH+9jrtvT5eBwGnQHEbD8f3LS4=;
        b=GHNsrf4r82idDLjJS2AHJnlBPM6GEbxGK0jOAdX44HLAjVn4joEGbqk6+nrTTtXiL8
         6L+yr3xaYccZHD3RvVXnD0XZ5FK+2tuw3W7bXfxLIk7UxwhwW9TiMyYF5CpsxbNK08IT
         1VO9ZFdiPLEzb0L5JttOfJhK9UlPSXJteWuFcllVUOp58wairbSGwBKzWzydMNORxQf5
         BtWtsZeo1oOK4iMRAf+JxQdHMDKqyGlBWKRYotbWXdBCQPkTiSkfIaOayCSPfObnC1PU
         hrmCaXQpOmF6RgiCRdJ7vJLz8r+E/G9DQxBjz9fiy4fHwD/F3aeEkzxb3KhTEpWzu3UI
         g7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vXhYKsEgtOtgmS2aSTH+9jrtvT5eBwGnQHEbD8f3LS4=;
        b=AiviNu3rW40jDhg7dUInX4dzkg7sAGeAkF1NuI+BoMIcEgfovk5fOqGBxS4yLqG6a6
         cSoWl5p379qCbjjIaeUJaNcgHFDHKnSB+ka5MlpXUCMGGn2Udc62ZkmBr746ZExuxZMP
         xceLVCZty+BRka5q/TaMOHU70ocar+zeNMIO1djv3Bz9gwM3Kz5g2YzAYC6YujGEsdtg
         79q7RpvZOmPl+eX9pu+KCfdx+7HmWG3rhgTD4eBTl8JQ6vr0Vwr2QZ0b/865ps/m8/in
         OqwrD25l1toe9wUGvGqCuZP/7c/PjarW6XqD+cCeXTBLB51GFULnm30avy2BNogqbhuO
         5t2w==
X-Gm-Message-State: ANhLgQ1tqVMQtlDx898gMHvf9H5rZuVQGVlriFV4r/LE/OQwKdOqUtuv
        JEKkILmiO0qYU+uGotYA7WITovWgP78=
X-Google-Smtp-Source: ADFU+vsE2mHV0veywNiOl1WQtHYDlMdkrAltxtd+XxZXrYLdh90LH1fQGQJgzzIGFWE05nB2iXUBFw==
X-Received: by 2002:a63:5f41:: with SMTP id t62mr9662004pgb.114.1584051135609;
        Thu, 12 Mar 2020 15:12:15 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j2sm20945362pfg.169.2020.03.12.15.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:12:15 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com,
        arnaud.pouliquen@st.com, fabien.dessenne@st.com
Subject: [PATCH 14/18] remoteproc: Refactor function rproc_trigger_recovery()
Date:   Thu, 12 Mar 2020 16:11:54 -0600
Message-Id: <20200312221158.3613-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_trigger_recovery() in order to avoid
reloading the fw image when synchronising with an MCU rather than
booting it.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 806201af9470..7ea4397a9004 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1659,7 +1659,7 @@ static void rproc_coredump(struct rproc *rproc)
  */
 int rproc_trigger_recovery(struct rproc *rproc)
 {
-	const struct firmware *firmware_p;
+	const struct firmware *firmware_p = NULL;
 	struct device *dev = &rproc->dev;
 	int ret;
 
@@ -1676,14 +1676,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	/* generate coredump */
 	rproc_coredump(rproc);
 
-	/* load firmware */
-	ret = request_firmware(&firmware_p, rproc->firmware, dev);
-	if (ret < 0) {
-		dev_err(dev, "request_firmware failed: %d\n", ret);
-		goto unlock_mutex;
+	/* load firmware if need be */
+	if (!rproc_sync_with_mcu(rproc)) {
+		ret = request_firmware(&firmware_p, rproc->firmware, dev);
+		if (ret < 0) {
+			dev_err(dev, "request_firmware failed: %d\n", ret);
+			goto unlock_mutex;
+		}
 	}
 
-	/* boot the remote processor up again */
+	/* boot up or synchronise with the remote processor again */
 	ret = rproc_start(rproc, firmware_p);
 
 	release_firmware(firmware_p);
-- 
2.20.1

