Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A304E5051FA
	for <lists+linux-remoteproc@lfdr.de>; Mon, 18 Apr 2022 14:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239533AbiDRMk2 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 18 Apr 2022 08:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240756AbiDRMjg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Apr 2022 08:39:36 -0400
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0164B12627;
        Mon, 18 Apr 2022 05:30:26 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23ICULIK120040;
        Mon, 18 Apr 2022 07:30:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1650285021;
        bh=V24Pg9flw1bNbkBXpcqZ1XDD4yowcEtZAzI4rpfzD24=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HM7pxqH4EpECKH9mLgBhzBdlvQSeWZqPpWuu8+laRvVipNu7r2pPFrE5uWuTaqw+R
         a3EytiP4bIwXUZbtP19jVsJCk+mpgQT1QuvfIELQU6X2cQTd4MMwnFoN7LSeV5IXg5
         bvIuwNwkTH2Os7IB1TXl6OCX/ItiXLIpB2aUjQ7A=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23ICUL66015761
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 Apr 2022 07:30:21 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Apr 2022 07:30:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Apr 2022 07:30:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23ICUJRH032161;
        Mon, 18 Apr 2022 07:30:20 -0500
From:   Puranjay Mohan <p-mohan@ti.com>
To:     <linux-kernel@vger.kernel.org>
CC:     <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>, <s-anna@ti.com>,
        <p-mohan@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <rogerq@kernel.org>, <grygorii.strashko@ti.com>, <vigneshr@ti.com>,
        <kishon@ti.com>
Subject: [PATCH v2 6/6] soc: ti: pruss: Add helper functions to get/set PRUSS_CFG_GPMUX
Date:   Mon, 18 Apr 2022 18:00:04 +0530
Message-ID: <20220418123004.9332-7-p-mohan@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220418123004.9332-1-p-mohan@ti.com>
References: <20220418123004.9332-1-p-mohan@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Add two new helper functions pruss_cfg_get_gpmux() & pruss_cfg_set_gpmux()
to get and set the GP MUX mode for programming the PRUSS internal wrapper
mux functionality as needed by usecases.

Co-developed-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
---
 include/linux/pruss_driver.h | 44 ++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/linux/pruss_driver.h b/include/linux/pruss_driver.h
index e2d5477225c6..3312281ef4c1 100644
--- a/include/linux/pruss_driver.h
+++ b/include/linux/pruss_driver.h
@@ -35,4 +35,48 @@ struct pruss {
 	struct clk *iep_clk_mux;
 };
 
+/**
+ * pruss_cfg_get_gpmux() - get the current GPMUX value for a PRU device
+ * @pruss: pruss instance
+ * @pru_id: PRU identifier (0-1)
+ * @mux: pointer to store the current mux value into
+ *
+ * Return: 0 on success, or an error code otherwise
+ */
+static inline int pruss_cfg_get_gpmux(struct pruss *pruss,
+				      enum pruss_pru_id pru_id, u8 *mux)
+{
+	int ret = 0;
+	u32 val;
+
+	if (pru_id < 0 || pru_id >= PRUSS_NUM_PRUS)
+		return -EINVAL;
+
+	ret = pruss_cfg_read(pruss, PRUSS_CFG_GPCFG(pru_id), &val);
+	if (!ret)
+		*mux = (u8)((val & PRUSS_GPCFG_PRU_MUX_SEL_MASK) >>
+			    PRUSS_GPCFG_PRU_MUX_SEL_SHIFT);
+	return ret;
+}
+
+/**
+ * pruss_cfg_set_gpmux() - set the GPMUX value for a PRU device
+ * @pruss: pruss instance
+ * @pru_id: PRU identifier (0-1)
+ * @mux: new mux value for PRU
+ *
+ * Return: 0 on success, or an error code otherwise
+ */
+static inline int pruss_cfg_set_gpmux(struct pruss *pruss,
+				      enum pruss_pru_id pru_id, u8 mux)
+{
+	if (mux >= PRUSS_GP_MUX_SEL_MAX ||
+	    pru_id < 0 || pru_id >= PRUSS_NUM_PRUS)
+		return -EINVAL;
+
+	return pruss_cfg_update(pruss, PRUSS_CFG_GPCFG(pru_id),
+				PRUSS_GPCFG_PRU_MUX_SEL_MASK,
+				(u32)mux << PRUSS_GPCFG_PRU_MUX_SEL_SHIFT);
+}
+
 #endif	/* _PRUSS_DRIVER_H_ */
-- 
2.17.1

