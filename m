Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7231C7C73A6
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Oct 2023 19:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344025AbjJLRER (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Oct 2023 13:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347307AbjJLREQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Oct 2023 13:04:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18979E1
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Oct 2023 10:04:15 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4223C433C7;
        Thu, 12 Oct 2023 17:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697130254;
        bh=ZbdxYCJsXfSn4QkqlDcEI6V10CuHxqW03BUMi4lw3m0=;
        h=From:Date:Subject:To:Cc:From;
        b=SRNW6j7HGGAHmacPEdOqt+JeMG3zGuNbwTV382uqdBmFfS7ikqffSrG+Ydam7u4IY
         OBSt7vtJvGSuzIaeSJoINXkJsq+BNPyJEng4/kp+HQtvBot3UrflA1wc5CgllJXLEZ
         p0hUBKYC2NUNrWOiHzzKhfhCsy6CDGD8qksJQAmNS30QOCOK+l9fK1GC+ml9kDOzAd
         YxhdGP0mDtKnveSL/QkVm9url4IbMD6PuQUTWbzdptUvEpxVTEKMJOgxlv2GJyKPBd
         qW4K3LLlxAf0Q3w+THt4pc/pH66WI7U4KFU3IcNYNbLR50OimMkP23Hzzc57bnFAcr
         WdA6hj92AeoGQ==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Thu, 12 Oct 2023 10:04:01 -0700
Subject: [PATCH] remoteproc: st: Fix sometimes uninitialized ret in
 st_rproc_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231012-st_remoteproc-fix-sometimes-uninit-v1-1-f64d0f2d5b37@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAnKGUC/x2NzQqDMBAGX0X23AUTBdFXKaX486XdQxLZTUtBf
 PcGjwPDzEEGFRhNzUGKr5jkVMHdGlrfc3qBZatMvvWda51nK09FzAW75pWD/NhyRJEI40+SJIW
 HOQS3bMvQ9SPV0K6o3jW5P87zDy5aRZh0AAAA
To:     patrice.chotard@foss.st.com, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org
Cc:     ndesaulniers@google.com, trix@redhat.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ZbdxYCJsXfSn4QkqlDcEI6V10CuHxqW03BUMi4lw3m0=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDKka6rzCHx9MkA7/rbR2W+GjN4s5U7vemOWZzCr/ccpOq
 EHsufbSjlIWBjEOBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCR6gMMf7hv2UY/THn/dv+K
 L4u/PezbsI31QYY3w6z+S0derXlt7sPKyNCUcbwyLsUybPX6jb/LNPeWSNi+aFR7rPD3ja53+xo
 xLw4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Clang warns (or errors with CONFIG_WERROR=y):

  drivers/remoteproc/st_remoteproc.c:357:6: error: variable 'ret' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    357 |         if (!ddata->config)
        |             ^~~~~~~~~~~~~~
  drivers/remoteproc/st_remoteproc.c:442:9: note: uninitialized use occurs here
    442 |         return ret;
        |                ^~~
  drivers/remoteproc/st_remoteproc.c:357:2: note: remove the 'if' if its condition is always false
    357 |         if (!ddata->config)
        |         ^~~~~~~~~~~~~~~~~~~
    358 |                 goto free_rproc;
        |                 ~~~~~~~~~~~~~~~
  drivers/remoteproc/st_remoteproc.c:348:9: note: initialize the variable 'ret' to silence this warning
    348 |         int ret, i;
        |                ^
        |                 = 0
  1 error generated.

Set ret to -ENODEV, which seems to be a standard return code when
device_get_match_data() returns NULL.

Closes: https://github.com/ClangBuiltLinux/linux/issues/1944
Fixes: 5c77ebcd05ac ("remoteproc: st: Use device_get_match_data()")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/remoteproc/st_remoteproc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index b0638f984842..cb163766c56d 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -354,8 +354,10 @@ static int st_rproc_probe(struct platform_device *pdev)
 	rproc->has_iommu = false;
 	ddata = rproc->priv;
 	ddata->config = (struct st_rproc_config *)device_get_match_data(dev);
-	if (!ddata->config)
+	if (!ddata->config) {
+		ret = -ENODEV;
 		goto free_rproc;
+	}
 
 	platform_set_drvdata(pdev, rproc);
 

---
base-commit: 5c77ebcd05acf3789949c8a387df72381d949ca2
change-id: 20231012-st_remoteproc-fix-sometimes-uninit-7aff1bdb7349

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

