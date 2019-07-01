Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66DF1326F6
	for <lists+linux-remoteproc@lfdr.de>; Mon,  3 Jun 2019 05:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfFCDqS (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 2 Jun 2019 23:46:18 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46122 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbfFCDqR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 2 Jun 2019 23:46:17 -0400
Received: by mail-pg1-f194.google.com with SMTP id v9so7437759pgr.13
        for <linux-remoteproc@vger.kernel.org>; Sun, 02 Jun 2019 20:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DqQsssrKfCNHET6Z7Kn/Waano6R+KFGgvLUyk7CpWxA=;
        b=FnK7ShFMNnOJUR9bt+OqR4uBfI/0o+IzQJXZsgHzXdmzk/Qxd/cEtu/fZeGPsemfxD
         wG4ur+GJrXX93SHNelWysyl/1qhUobNHLvc7Dxusvid/8HiXzCNJOSC3lej1+DInbiTA
         lQOa1Fiix5ug6Hq5WdYJ3m9aRGlw2bTzBONvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DqQsssrKfCNHET6Z7Kn/Waano6R+KFGgvLUyk7CpWxA=;
        b=UwcMUBILuWRkoNntUgLO0NPs7XOJW780TyJp83nHgeQS3PiW1nzdmTjAe6oxiqXNG3
         1ctyeBZJrzI7Gpm3P2HuP8bGZ65xw3QCwbpMG7Tpy3QCkPbGooEOxoE2C4D3cv8fBJ8n
         sBWK9FaV7TgMtQE6SzRuj0E7eyl8652qC3Cpsn53O3GJp4DcqgVQqzNdtjfNbW9odv8c
         vpj+Y1U9zrY7RWlHaBiOo+2JQjnyz03rTpNkdcJt2DiBM9H2/Zz8TuzqZdStnqKb1eOh
         3pDX1Iuo+9+bXO4OfyVU1BZbGxIVyDThuYrtaJv8HmAkAKGyURxzro6MqIJ/75+AgSoK
         Ib2w==
X-Gm-Message-State: APjAAAWMdVLmfN+sAIOmKZ/SSHkURPNDhgVyejThuZNKQdHi4Q97sjaD
        QoOH7KOh1BLrlmJnrYouAV6u4w==
X-Google-Smtp-Source: APXvYqxlzGQm7aI2ikroH9IKY8tmFJTNcrejEvCGPKks4wtI4Z3cBN1IuwMBbEPnzts9DtmXgSzcMw==
X-Received: by 2002:a63:31c7:: with SMTP id x190mr11307250pgx.376.1559533577022;
        Sun, 02 Jun 2019 20:46:17 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id i73sm11878960pje.9.2019.06.02.20.46.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 20:46:16 -0700 (PDT)
From:   Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>, Erin Lo <erin.lo@mediatek.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR
        (REMOTEPROC) SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v10 3/7] remoteproc: mt8183: add reserved memory manager API
Date:   Mon,  3 Jun 2019 11:45:08 +0800
Message-Id: <20190603034529.154969-4-pihsun@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190603034529.154969-1-pihsun@chromium.org>
References: <20190603034529.154969-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Erin Lo <erin.lo@mediatek.com>

Add memory table mapping API for other driver to lookup
reserved physical and virtual memory

Signed-off-by: Erin Lo <erin.lo@mediatek.com>
Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---
Changes from v9:
 - No change.

Changes from v8:
 - Add more reserved regions for camera ISP.

Changes from v7, v6, v5:
 - No change.

Changes from v4:
 - New patch.
---
 drivers/remoteproc/mtk_scp.c          | 135 ++++++++++++++++++++++++++
 include/linux/platform_data/mtk_scp.h |  24 +++++
 2 files changed, 159 insertions(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index c4d900f4fe1c..bebecd470b8d 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -348,6 +348,137 @@ void *scp_mapping_dm_addr(struct platform_device *pdev, u32 mem_addr)
 }
 EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
 
+#if SCP_RESERVED_MEM
+phys_addr_t scp_mem_base_phys;
+phys_addr_t scp_mem_base_virt;
+phys_addr_t scp_mem_size;
+
+static struct scp_reserve_mblock scp_reserve_mblock[] = {
+	{
+		.num = SCP_ISP_MEM_ID,
+		.start_phys = 0x0,
+		.start_virt = 0x0,
+		.size = 0x200000, /*2MB*/
+	},
+	{
+		.num = SCP_ISP_MEM2_ID,
+		.start_phys = 0x0,
+		.start_virt = 0x0,
+		.size = 0x800000, /*8MB*/
+	},
+	{
+		.num = SCP_DIP_MEM_ID,
+		.start_phys = 0x0,
+		.start_virt = 0x0,
+		.size = 0x900000, /*9MB*/
+	},
+	{
+		.num = SCP_MDP_MEM_ID,
+		.start_phys = 0x0,
+		.start_virt = 0x0,
+		.size = 0x600000, /*6MB*/
+	},
+	{
+		.num = SCP_FD_MEM_ID,
+		.start_phys = 0x0,
+		.start_virt = 0x0,
+		.size = 0x100000, /*1MB*/
+	},
+};
+
+static int scp_reserve_mem_init(struct mtk_scp *scp)
+{
+	enum scp_reserve_mem_id_t id;
+	phys_addr_t accumlate_memory_size = 0;
+
+	scp_mem_base_phys = (phys_addr_t) (scp->phys_addr + MAX_CODE_SIZE);
+	scp_mem_size = (phys_addr_t) (scp->dram_size - MAX_CODE_SIZE);
+
+	dev_info(scp->dev,
+		 "phys:0x%llx - 0x%llx (0x%llx)\n",
+		 scp_mem_base_phys,
+		 scp_mem_base_phys + scp_mem_size,
+		 scp_mem_size);
+	accumlate_memory_size = 0;
+	for (id = 0; id < SCP_NUMS_MEM_ID; id++) {
+		scp_reserve_mblock[id].start_phys =
+			scp_mem_base_phys + accumlate_memory_size;
+		accumlate_memory_size += scp_reserve_mblock[id].size;
+		dev_info(scp->dev,
+			 "[reserve_mem:%d]: phys:0x%llx - 0x%llx (0x%llx)\n",
+			 id, scp_reserve_mblock[id].start_phys,
+			 scp_reserve_mblock[id].start_phys +
+				 scp_reserve_mblock[id].size,
+			 scp_reserve_mblock[id].size);
+	}
+	return 0;
+}
+
+static int scp_reserve_memory_ioremap(struct mtk_scp *scp)
+{
+	enum scp_reserve_mem_id_t id;
+	phys_addr_t accumlate_memory_size = 0;
+
+	scp_mem_base_virt = (phys_addr_t)(size_t)ioremap_wc(scp_mem_base_phys,
+							    scp_mem_size);
+
+	dev_info(scp->dev,
+		 "virt:0x%llx - 0x%llx (0x%llx)\n",
+		(phys_addr_t)scp_mem_base_virt,
+		(phys_addr_t)scp_mem_base_virt + (phys_addr_t)scp_mem_size,
+		scp_mem_size);
+	for (id = 0; id < SCP_NUMS_MEM_ID; id++) {
+		scp_reserve_mblock[id].start_virt =
+			scp_mem_base_virt + accumlate_memory_size;
+		accumlate_memory_size += scp_reserve_mblock[id].size;
+	}
+	/* the reserved memory should be larger then expected memory
+	 * or scp_reserve_mblock does not match dts
+	 */
+	WARN_ON(accumlate_memory_size > scp_mem_size);
+#ifdef DEBUG
+	for (id = 0; id < NUMS_MEM_ID; id++) {
+		dev_info(scp->dev,
+			 "[mem_reserve-%d] phys:0x%llx,virt:0x%llx,size:0x%llx\n",
+			 id,
+			 scp_get_reserve_mem_phys(id),
+			 scp_get_reserve_mem_virt(id),
+			 scp_get_reserve_mem_size(id));
+	}
+#endif
+	return 0;
+}
+phys_addr_t scp_get_reserve_mem_phys(enum scp_reserve_mem_id_t id)
+{
+	if (id >= SCP_NUMS_MEM_ID) {
+		pr_err("[SCP] no reserve memory for %d", id);
+		return 0;
+	} else
+		return scp_reserve_mblock[id].start_phys;
+}
+EXPORT_SYMBOL_GPL(scp_get_reserve_mem_phys);
+
+phys_addr_t scp_get_reserve_mem_virt(enum scp_reserve_mem_id_t id)
+{
+	if (id >= SCP_NUMS_MEM_ID) {
+		pr_err("[SCP] no reserve memory for %d", id);
+		return 0;
+	} else
+		return scp_reserve_mblock[id].start_virt;
+}
+EXPORT_SYMBOL_GPL(scp_get_reserve_mem_virt);
+
+phys_addr_t scp_get_reserve_mem_size(enum scp_reserve_mem_id_t id)
+{
+	if (id >= SCP_NUMS_MEM_ID) {
+		pr_err("[SCP] no reserve memory for %d", id);
+		return 0;
+	} else
+		return scp_reserve_mblock[id].size;
+}
+EXPORT_SYMBOL_GPL(scp_get_reserve_mem_size);
+#endif
+
 static int scp_map_memory_region(struct mtk_scp *scp)
 {
 	struct device_node *node;
@@ -375,6 +506,10 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 		return -EBUSY;
 	}
 
+#if SCP_RESERVED_MEM
+	scp_reserve_mem_init(scp);
+	scp_reserve_memory_ioremap(scp);
+#endif
 	return 0;
 }
 
diff --git a/include/linux/platform_data/mtk_scp.h b/include/linux/platform_data/mtk_scp.h
index b81ac5c7d320..96e56fdd0917 100644
--- a/include/linux/platform_data/mtk_scp.h
+++ b/include/linux/platform_data/mtk_scp.h
@@ -138,4 +138,28 @@ unsigned int scp_get_venc_hw_capa(struct platform_device *pdev);
 void *scp_mapping_dm_addr(struct platform_device *pdev,
 			  u32 mem_addr);
 
+#define SCP_RESERVED_MEM	(1)
+#if SCP_RESERVED_MEM
+/* scp reserve memory ID definition*/
+enum scp_reserve_mem_id_t {
+	SCP_ISP_MEM_ID,
+	SCP_ISP_MEM2_ID,
+	SCP_MDP_MEM_ID,
+	SCP_DIP_MEM_ID,
+	SCP_FD_MEM_ID,
+	SCP_NUMS_MEM_ID,
+};
+
+struct scp_reserve_mblock {
+	enum scp_reserve_mem_id_t num;
+	u64 start_phys;
+	u64 start_virt;
+	u64 size;
+};
+
+extern phys_addr_t scp_get_reserve_mem_phys(enum scp_reserve_mem_id_t id);
+extern phys_addr_t scp_get_reserve_mem_virt(enum scp_reserve_mem_id_t id);
+extern phys_addr_t scp_get_reserve_mem_size(enum scp_reserve_mem_id_t id);
+#endif
+
 #endif /* _MTK_SCP_H */
-- 
2.22.0.rc1.257.g3120a18244-goog

