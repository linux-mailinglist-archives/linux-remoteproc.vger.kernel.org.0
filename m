Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003F721D733
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Jul 2020 15:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729908AbgGMNaD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 13 Jul 2020 09:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729877AbgGMN3p (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Jul 2020 09:29:45 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC1FC08C5DD
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2020 06:29:44 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id o11so16587231wrv.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2020 06:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oSu+1K12H2y++JPpQ7bF0nHcViWJKgsYEUK88PaV5IA=;
        b=a174UpCzaU+pokDHKTo0XRKcnSK9++2CtQdF2PRA7DPRE6SFH0GdR1oy7Eax9YaiuR
         eaz0ckpr8RdE6iwIlUcmGEihSBwhprfS7ABqTAJ7kHERNk0cIBTT3Ya4zGG3onIrA0LO
         i9xQVU53eIQmhKf6jUIE2XbnJpB6Fh+whd3yd31UCqcYZOC2LOWYQkD6hy2D3BXdqm1O
         63xqri6pcWe0F+qK8shiZpURzjBXc9P1AemrLuUvpkqokjAJ8XpCnU7jwvBFyEI2Neyz
         ZogK+gPV4GvtDL5KoRQbE70MATK7dvXHFPmRbRf1Hlq/GNqC2QIHufk1u5b5a9bX5PrH
         CYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oSu+1K12H2y++JPpQ7bF0nHcViWJKgsYEUK88PaV5IA=;
        b=AdOOiEdjAxys09txuF3T5l3ffW2sEeSZ8L2LpOY+UedKlWI4J1H/DK4tVegnhy2vUz
         j3K6S+IfIVPgBKG/5uNRy7lUw2BoWiD98w3gDAOsQdBDZJcRI3pZWLgd7MI4ZIM3naaY
         twFi/pTntodFRwdnx4W77xRpKBMYu2T7ymVxeAW9BGR1B30nXLGBZBIP0IEntsjLTpXX
         sQmjKCwL2A6Bl39fG3qaRDiwG97I9WLPx1DmWOK68BaNEEIA4mmJXDTD03KBACoyTum6
         5hNV36o9INlGsU0BIpdtazD4S9dvz/mYLt2eUuq0ZhHbCTk9IjQS+eZvKYcLhEtrzAm3
         fyZQ==
X-Gm-Message-State: AOAM533LYPdVpH5XxVS1Zo39BrfDCpY9fMD+0Jq/atMtzddvIo4R33+g
        IHOBoydLHf0+LEH7ZpYrAVV7pg==
X-Google-Smtp-Source: ABdhPJycVG+zThNXV9DKZfWoqtnN5B2kv5vybyBk7BeigrXGxa0WgoQ2TqiDgSb6D86DkNJ+OOHUvA==
X-Received: by 2002:adf:ea84:: with SMTP id s4mr78139301wrm.222.1594646983429;
        Mon, 13 Jul 2020 06:29:43 -0700 (PDT)
Received: from linux.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j14sm23896642wrs.75.2020.07.13.06.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 06:29:42 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 3/6] remoteproc: mtk_vpu_rproc: Add support of JTAG
Date:   Mon, 13 Jul 2020 15:29:24 +0200
Message-Id: <20200713132927.24925-4-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713132927.24925-1-abailon@baylibre.com>
References: <20200713132927.24925-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The DSP could be debugged using JTAG.
The support of JTAG could enabled at build time and it could be enabled
using debugfs.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/remoteproc/Kconfig         |   9 ++
 drivers/remoteproc/mtk_apu_rproc.c | 156 ++++++++++++++++++++++++++++-
 2 files changed, 162 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index e116d4a12ac3..e1158563e2e8 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -52,6 +52,15 @@ config MTK_APU
 
 	  It's safe to say N here.
 
+config MTK_APU_JTAG
+	bool "Enable support of JTAG"
+	depends on MTK_APU
+	help
+	  Say y to enable support of JTAG.
+	  By default, JTAG will remain disabled until it is enabled using
+	  debugfs: remoteproc/remoteproc0/jtag. Write 1 to enable it and
+	  0 to disable it.
+
 config OMAP_REMOTEPROC
 	tristate "OMAP remoteproc support"
 	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
diff --git a/drivers/remoteproc/mtk_apu_rproc.c b/drivers/remoteproc/mtk_apu_rproc.c
index fb416a817ef3..f2342b747a35 100644
--- a/drivers/remoteproc/mtk_apu_rproc.c
+++ b/drivers/remoteproc/mtk_apu_rproc.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitops.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -14,6 +15,7 @@
 #include <linux/highmem.h>
 #include <linux/module.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
 
@@ -48,6 +50,11 @@
 #define CORE_DEFAULT1				(0x00000140)
 #define  CORE_DEFAULT0_ARUSER_IDMA_USE_IOMMU	(0x10 << 0)
 #define  CORE_DEFAULT0_AWUSER_IDMA_USE_IOMMU	(0x10 << 5)
+#define CORE_DEFAULT2				(0x00000144)
+#define CORE_DEFAULT2_DBG_EN			BIT(3)
+#define CORE_DEFAULT2_NIDEN			BIT(2)
+#define CORE_DEFAULT2_SPNIDEN			BIT(1)
+#define CORE_DEFAULT2_SPIDEN			BIT(0)
 #define CORE_XTENSA_ALTRESETVEC			(0x000001F8)
 
 struct mtk_vpu_rproc {
@@ -59,6 +66,13 @@ struct mtk_vpu_rproc {
 	struct clk *axi;
 	struct clk *ipu;
 	struct clk *jtag;
+
+#ifdef CONFIG_MTK_APU_JTAG
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_default;
+	struct pinctrl_state *pinctrl_jtag;
+	bool jtag_enabled;
+#endif
 };
 
 static u32 vpu_read32(struct mtk_vpu_rproc *vpu_rproc, u32 off)
@@ -149,6 +163,133 @@ static irqreturn_t handle_event(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+#ifdef CONFIG_MTK_APU_JTAG
+
+static int vpu_enable_jtag(struct mtk_vpu_rproc *vpu_rproc)
+{
+	int ret = 0;
+
+	if (vpu_rproc->jtag_enabled)
+		return -EINVAL;
+
+	ret = pinctrl_select_state(vpu_rproc->pinctrl,
+				   vpu_rproc->pinctrl_jtag);
+	if (ret < 0) {
+		dev_err(vpu_rproc->dev, "Failed to configure pins for JTAG\n");
+		return ret;
+	}
+
+	vpu_write32(vpu_rproc, CORE_DEFAULT2,
+		    CORE_DEFAULT2_SPNIDEN | CORE_DEFAULT2_SPIDEN |
+		    CORE_DEFAULT2_NIDEN | CORE_DEFAULT2_DBG_EN);
+
+	vpu_rproc->jtag_enabled = 1;
+
+	return ret;
+}
+
+static int vpu_disable_jtag(struct mtk_vpu_rproc *vpu_rproc)
+{
+	int ret = 0;
+
+	if (!vpu_rproc->jtag_enabled)
+		return -EINVAL;
+
+	vpu_write32(vpu_rproc, CORE_DEFAULT2, 0);
+
+	ret = pinctrl_select_state(vpu_rproc->pinctrl,
+				   vpu_rproc->pinctrl_default);
+	if (ret < 0) {
+		dev_err(vpu_rproc->dev,
+			"Failed to configure pins to default\n");
+		return ret;
+	}
+
+	vpu_rproc->jtag_enabled = 0;
+
+	return ret;
+}
+
+static ssize_t rproc_jtag_read(struct file *filp, char __user *userbuf,
+			       size_t count, loff_t *ppos)
+{
+	struct rproc *rproc = filp->private_data;
+	struct mtk_vpu_rproc *vpu_rproc = (struct mtk_vpu_rproc *)rproc->priv;
+	char *buf = vpu_rproc->jtag_enabled ? "enabled\n" : "disabled\n";
+
+	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
+}
+
+static ssize_t rproc_jtag_write(struct file *filp, const char __user *user_buf,
+				size_t count, loff_t *ppos)
+{
+	struct rproc *rproc = filp->private_data;
+	struct mtk_vpu_rproc *vpu_rproc = (struct mtk_vpu_rproc *)rproc->priv;
+	char buf[10];
+	int ret;
+
+	if (count < 1 || count > sizeof(buf))
+		return -EINVAL;
+
+	ret = copy_from_user(buf, user_buf, count);
+	if (ret)
+		return -EFAULT;
+
+	/* remove end of line */
+	if (buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
+
+	if (!strncmp(buf, "1", count) || !strncmp(buf, "enabled", count))
+		ret = vpu_enable_jtag(vpu_rproc);
+	else if (!strncmp(buf, "0", count) || !strncmp(buf, "disabled", count))
+		ret = vpu_disable_jtag(vpu_rproc);
+	else
+		return -EINVAL;
+
+	return ret ? ret : count;
+}
+
+static const struct file_operations rproc_jtag_ops = {
+	.read = rproc_jtag_read,
+	.write = rproc_jtag_write,
+	.open = simple_open,
+};
+
+static int vpu_jtag_probe(struct mtk_vpu_rproc *vpu_rproc)
+{
+	int ret;
+
+	if (!vpu_rproc->rproc->dbg_dir)
+		return -ENODEV;
+
+	vpu_rproc->pinctrl = devm_pinctrl_get(vpu_rproc->dev);
+	if (IS_ERR(vpu_rproc->pinctrl)) {
+		dev_warn(vpu_rproc->dev, "Failed to find JTAG pinctrl\n");
+		return PTR_ERR(vpu_rproc->pinctrl);
+	}
+
+	vpu_rproc->pinctrl_default = pinctrl_lookup_state(vpu_rproc->pinctrl,
+							PINCTRL_STATE_DEFAULT);
+	if (IS_ERR(vpu_rproc->pinctrl_default))
+		return PTR_ERR(vpu_rproc->pinctrl_default);
+
+	vpu_rproc->pinctrl_jtag = pinctrl_lookup_state(vpu_rproc->pinctrl,
+						       "jtag");
+	if (IS_ERR(vpu_rproc->pinctrl_jtag))
+		return PTR_ERR(vpu_rproc->pinctrl_jtag);
+
+	ret = pinctrl_select_state(vpu_rproc->pinctrl,
+				   vpu_rproc->pinctrl_default);
+	if (ret < 0)
+		return ret;
+
+	debugfs_create_file("jtag", 0600, vpu_rproc->rproc->dbg_dir,
+			    vpu_rproc->rproc, &rproc_jtag_ops);
+
+	return 0;
+}
+#endif /* CONFIG_MTK_APU_JTAG */
+
 static int mtk_vpu_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -228,16 +369,16 @@ static int mtk_vpu_rproc_probe(struct platform_device *pdev)
 		goto clk_disable_ipu;
 	}
 
-	vpu_rproc->jtag = devm_clk_get_optional(dev, "jtag");
+	vpu_rproc->jtag = devm_clk_get(vpu_rproc->dev, "jtag");
 	if (IS_ERR(vpu_rproc->jtag)) {
-		dev_err(dev, "Failed to enable jtag clock\n");
+		dev_err(vpu_rproc->dev, "Failed to get jtag clock\n");
 		ret = PTR_ERR(vpu_rproc->jtag);
 		goto clk_disable_axi;
 	}
 
 	ret = clk_prepare_enable(vpu_rproc->jtag);
 	if (ret) {
-		dev_err(dev, "Failed to enable jtag clock\n");
+		dev_err(vpu_rproc->dev, "Failed to enable jtag clock\n");
 		goto clk_disable_axi;
 	}
 
@@ -253,6 +394,12 @@ static int mtk_vpu_rproc_probe(struct platform_device *pdev)
 		goto free_mem;
 	}
 
+#ifdef CONFIG_MTK_APU_JTAG
+	ret = vpu_jtag_probe(vpu_rproc);
+	if (ret)
+		dev_warn(dev, "Failed to configure jtag\n");
+#endif
+
 	return 0;
 
 free_mem:
@@ -277,6 +424,9 @@ static int mtk_vpu_rproc_remove(struct platform_device *pdev)
 
 	disable_irq(vpu_rproc->irq);
 
+#ifdef CONFIG_MTK_APU_JTAG
+	vpu_disable_jtag(vpu_rproc);
+#endif
 	rproc_del(rproc);
 	of_reserved_mem_device_release(dev);
 	clk_disable_unprepare(vpu_rproc->jtag);
-- 
2.26.2

