Return-Path: <linux-remoteproc+bounces-3924-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2085AD2C30
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Jun 2025 05:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94DBD188F7A0
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Jun 2025 03:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5680C25B1C5;
	Tue, 10 Jun 2025 03:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="Qzd2F1kv"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2058E2AF1B;
	Tue, 10 Jun 2025 03:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527034; cv=pass; b=FFjXj9gGNuJT5KJa+x68FE49TbvOHytJmKpGnI/YrhiWuxBm/6Jpzrf8T5cLFmAaFSH+OeSDMHWc4Co4/syQ7u/ronPxQxgzEemqgMVBjpsEUac1otgllS5psJebCpRRYSgNcOWYXQjoDcFmdmdBYQX97BIDXoDcmddY6puNNZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527034; c=relaxed/simple;
	bh=eTkY3IkCNA3kGovKmUnSPEDBKqEDtvA31Wvs+Dt/Ods=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=jp+NqMuxKHanyAVr8inYAzbihrocW9lQtEWjQXEyYhq38jipGHUva0b0jBPQ7+SqvjXx4fDdTprNh8DT4XLhTRMrDpBEHcgHUWTsez+ae+gN3Ct44aRJiYyBPES94rDboryN+MzgOfoD90nP9Bx3CVc/VCBtwQw5Ujq748GNoFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=Qzd2F1kv; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
ARC-Seal: i=1; a=rsa-sha256; t=1749526988; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AyE2uKouUp9jGovrP/v4olUh5qGOQLFEOHst/d1DgaroTKMCz9tsVEm9xS8SvEjRhL4buv1Z8JIKyZinoaL66kuf/1MlycTkZYQ9nErlC44GVtNACqUih0E/O6WOhkh542tU68ScOfHuffRVSwyzE3ww5NyCZ0KVinuQDjsg9ms=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749526988; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=u3oAQahbNx1vgahx0ICj2xmfgptN5IERWf/QVVGuikI=; 
	b=AAyJ/Q0Mf9YjG05m0yJAz0qxGZHCJhal5NLFI4zVOOE3pFqyF5eGF+MFxR3S4Jlicu4cckWhYs2uoh0Wvi5aAtxpVszHK2qfzxX2LW0XsV/kdhjMz4q6BFMLY19N1Mu4GsAUazoK7Kz+bulH/5hFB8gb8nCNmXIXR7pmTRfzgkM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749526988;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=u3oAQahbNx1vgahx0ICj2xmfgptN5IERWf/QVVGuikI=;
	b=Qzd2F1kvmYbIvFosIvjXsyRltp0I1Aw6m7kVCql0t8GWsO54VhFnPcjN4bKDBSzZ
	p2/7KEcgbB0VuAlkeMk6kg8OSOwsb/LHDsIcLLcV4DHYbZX6G1hN67UlGJAjcUKcYwY
	L0cutUiYMlQZdmDUUmSBNy5SfOIiyA3F0RfPj5UQ=
Received: by mx.zohomail.com with SMTPS id 1749526986447678.170425674402;
	Mon, 9 Jun 2025 20:43:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Peng Fan" <peng.fan@oss.nxp.com>
In-Reply-To: <20250609083803.GA13113@nxa18884-linux>
Cc: "Bjorn Andersson" <andersson@kernel.org>, 
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, <linux-remoteproc@vger.kernel.org>, 
	<devicetree@vger.kernel.org>, <sophgo@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/2] drivers: remoteproc: Add C906L controller for Sophgo
	 CV1800B SoC
Message-ID: <184791843e98e0a0.ed7541b3db6a6586.57e5fabaf9bf62ee@Jude-Air.local>
Date: Tue, 10 Jun 2025 03:42:57 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Peng,
Thanks for your review.

On 09/06/2025 16:43, Peng Fan wrote:
> On Sun, Jun 08, 2025 at 10:37:40AM +0800, Junhui Liu wrote:
>>Add initial support for the C906L remote processor found in the Sophgo
>>CV1800B SoC. The C906L is an asymmetric core typically used to run an
>>RTOS. This driver enables firmware loading and start/stop control of the
>>C906L processor via the remoteproc framework.
>>
>>The C906L and the main application processor can communicate through
>>mailboxes [1]. Support for mailbox-based functionality will be added in
>>a separate patch.
>>
>>Link: https://lore.kernel.org/linux-riscv/20250520-cv18xx-mbox-v4-0-fd4f1c=
676d6e@pigmoral.tech/ [1]
>>Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>>---
>> drivers/remoteproc/Kconfig                |   9 ++
>> drivers/remoteproc/Makefile               |   1 +
>> drivers/remoteproc/sophgo_cv1800b_c906l.c | 233 +++++++++++++++++++++++++=
+++++
>> 3 files changed, 243 insertions(+)
>>
>>diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>>index 83962a114dc9fdb3260e6e922602f2da53106265..7b09a8f00332605ee528ff7c21=
c31091c10c2bf5 100644
>>--- a/drivers/remoteproc/Kconfig
>>+++ b/drivers/remoteproc/Kconfig
>>@@ -299,6 +299,15 @@ config RCAR_REMOTEPROC
>> 	  This can be either built-in or a loadable module.
>> 	  If compiled as module (M), the module name is rcar_rproc.
>>=20
>>+config SOPHGO_CV1800B_C906L
>>+	tristate "Sophgo CV1800B C906L remoteproc support"
>>+	depends on ARCH_SOPHGO || COMPILE_TEST
>>+	help
>>+	  Say y here to support CV1800B C906L remote processor via the remote
>>+	  processor framework.
>>+
>>+	  It's safe to say N here.
>>+
>> config ST_REMOTEPROC
>> 	tristate "ST remoteproc support"
>> 	depends on ARCH_STI
>>diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>>index 1c7598b8475d6057a3e044b41e3515103b7aa9f1..3c1e9387491cedc9dda8219f1e=
9130a84538156f 100644
>>--- a/drivers/remoteproc/Makefile
>>+++ b/drivers/remoteproc/Makefile
>>@@ -33,6 +33,7 @@ obj-$(CONFIG_QCOM_WCNSS_PIL)		+=3D qcom_wcnss_pil.o
>> qcom_wcnss_pil-y			+=3D qcom_wcnss.o
>> qcom_wcnss_pil-y			+=3D qcom_wcnss_iris.o
>> obj-$(CONFIG_RCAR_REMOTEPROC)		+=3D rcar_rproc.o
>>+obj-$(CONFIG_SOPHGO_CV1800B_C906L)	+=3D sophgo_cv1800b_c906l.o
>> obj-$(CONFIG_ST_REMOTEPROC)		+=3D st_remoteproc.o
>> obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+=3D st_slim_rproc.o
>> obj-$(CONFIG_STM32_RPROC)		+=3D stm32_rproc.o
>>diff --git a/drivers/remoteproc/sophgo_cv1800b_c906l.c b/drivers/remotepro=
c/sophgo_cv1800b_c906l.c
>>new file mode 100644
>>index 0000000000000000000000000000000000000000..f3c8d8fd4f796d0cf64f8ab0dd=
797e017b8e8be7
>>--- /dev/null
>>+++ b/drivers/remoteproc/sophgo_cv1800b_c906l.c
>>@@ -0,0 +1,233 @@
>>+// SPDX-License-Identifier: GPL-2.0-or-later
>>+/*
>>+ * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
>>+ */
>>+
>>+#include <linux/mfd/syscon.h>
>>+#include <linux/module.h>
>>+#include <linux/of_device.h>
>>+#include <linux/of_reserved_mem.h>
>>+#include <linux/platform_device.h>
>>+#include <linux/remoteproc.h>
>>+#include <linux/reset.h>
>>+#include <linux/regmap.h>
>>+
>>+#include "remoteproc_internal.h"
>>+
>>+#define CV1800B_SYS_C906L_CTRL_REG	0x04
>>+#define   CV1800B_SYS_C906L_CTRL_EN	BIT(13)
>=20
> Align the format.
>=20
> '#include <linux/bits.h>' should be added for BIT
>=20

Will do in v2.

>>+
>>+#define CV1800B_SYS_C906L_BOOTADDR_REG	0x20
>>+
>>+/**
>>+ * struct cv1800b_c906l - C906L remoteproc structure
>>+ * @dev: private pointer to the device
>>+ * @reset: reset control handle
>>+ * @rproc: the remote processor handle
>>+ * @syscon: regmap for accessing security system registers
>>+ */
>>+struct cv1800b_c906l {
>>+	struct device *dev;
>>+	struct reset_control *reset;
>>+	struct rproc *rproc;
>>+	struct regmap *syscon;
>>+};
>>+
>>+static int cv1800b_c906l_mem_alloc(struct rproc *rproc,
>>+				   struct rproc_mem_entry *mem)
>>+{
>>+	void *va;
>>+
>>+	va =3D ioremap_wc(mem->dma, mem->len);
>>+	if (IS_ERR_OR_NULL(va))
>=20
> Use "if (!va)"?

Will do in v2.

>=20
>>+		return -ENOMEM;
>>+
>>+	/* Update memory entry va */
>>+	mem->va =3D va;
>>+
>>+	return 0;
>>+}
>>+
>>+static int cv1800b_c906l_mem_release(struct rproc *rproc,
>>+				     struct rproc_mem_entry *mem)
>>+{
>>+	iounmap(mem->va);
>>+
>>+	return 0;
>>+}
>>+
>>+static int cv1800b_c906l_add_carveout(struct rproc *rproc)
>>+{
>>+	struct device *dev =3D rproc->dev.parent;
>>+	struct device_node *np =3D dev->of_node;
>>+	struct of_phandle_iterator it;
>>+	struct rproc_mem_entry *mem;
>>+	struct reserved_mem *rmem;
>>+
>>+	/* Register associated reserved memory regions */
>>+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
>>+	while (of_phandle_iterator_next(&it) =3D=3D 0) {
>>+		rmem =3D of_reserved_mem_lookup(it.node);
>>+		if (!rmem) {
>>+			of_node_put(it.node);
>>+			return -EINVAL;
>>+		}
>=20
> Is there a need to handle vdev0buffer?

I'll exclude it.

>=20
>>+
>>+		mem =3D rproc_mem_entry_init(dev, NULL, (dma_addr_t)rmem->base,
>>+					   rmem->size, rmem->base,
>>+					   cv1800b_c906l_mem_alloc,
>>+					   cv1800b_c906l_mem_release,
>>+					   it.node->name);
>>+
>>+		if (!mem) {
>>+			of_node_put(it.node);
>>+			return -ENOMEM;
>>+		}
>>+
>>+		rproc_add_carveout(rproc, mem);
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static int cv1800b_c906l_prepare(struct rproc *rproc)
>>+{
>>+	struct cv1800b_c906l *priv =3D rproc->priv;
>>+	int ret;
>>+
>>+	ret =3D cv1800b_c906l_add_carveout(rproc);
>>+	if (ret)
>>+		return ret;
>>+
>>+	/*
>>+	 * This control bit must be set to enable the C906L remote processor.
>>+	 * Note that once the remote processor is running, merely clearing
>>+	 * this bit will not stop its execution.
>>+	 */
>>+	return regmap_update_bits(priv->syscon, CV1800B_SYS_C906L_CTRL_REG,
>>+				  CV1800B_SYS_C906L_CTRL_EN,
>>+				  CV1800B_SYS_C906L_CTRL_EN);
>>+}
>>+
>>+static int cv1800b_c906l_start(struct rproc *rproc)
>>+{
>>+	struct cv1800b_c906l *priv =3D rproc->priv;
>>+	u32 bootaddr[2];
>>+	int ret;
>>+
>>+	bootaddr[0] =3D lower_32_bits(rproc->bootaddr);
>>+	bootaddr[1] =3D upper_32_bits(rproc->bootaddr);
>>+
>>+	ret =3D regmap_bulk_write(priv->syscon, CV1800B_SYS_C906L_BOOTADDR_REG,
>>+				bootaddr, ARRAY_SIZE(bootaddr));
>>+	if (ret)
>>+		return ret;
>>+
>>+	return reset_control_deassert(priv->reset);
>>+}
>>+
>>+static int cv1800b_c906l_stop(struct rproc *rproc)
>>+{
>>+	struct cv1800b_c906l *priv =3D rproc->priv;
>>+
>>+	return reset_control_assert(priv->reset);
>>+}
>>+
>>+static int cv1800b_c906l_parse_fw(struct rproc *rproc,
>>+				  const struct firmware *fw)
>>+{
>>+	int ret;
>>+
>>+	ret =3D rproc_elf_load_rsc_table(rproc, fw);
>>+	if (ret =3D=3D -EINVAL) {
>>+		dev_info(&rproc->dev, "No resource table in elf\n");
>>+		ret =3D 0;
>>+	}
>>+
>>+	return ret;
>>+}
>>+
>>+static const struct rproc_ops cv1800b_c906l_ops =3D {
>>+	.prepare =3D cv1800b_c906l_prepare,
>>+	.start =3D cv1800b_c906l_start,
>>+	.stop =3D cv1800b_c906l_stop,
>>+	.load =3D rproc_elf_load_segments,
>>+	.parse_fw =3D cv1800b_c906l_parse_fw,
>>+	.find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
>>+	.sanity_check =3D rproc_elf_sanity_check,
>>+	.get_boot_addr =3D rproc_elf_get_boot_addr,
>=20
> Seems your setup does not support attach mode, so better add
> attach hook and return -ENOTSUPP?

I checked the remoteproc framework code and found that the attach
function will only be called when 'rproc->state =3D=3D RPROC_DETACHED', and
it seems that rproc->state will not be set to RPROC_DETACHED unless I do
so explicitly in the driver or an implemented detach function is called,
neither of which happens in this driver.

Given this, do we still need to add an attach hook even though it will
not be called in practice?

>=20
>>+};
>>+
>>+static int cv1800b_c906l_probe(struct platform_device *pdev)
>>+{
>>+	struct device *dev =3D &pdev->dev;
>>+	struct device_node *np =3D dev->of_node;
>>+	struct cv1800b_c906l *priv;
>>+	struct rproc *rproc;
>>+	const char *fw_name;
>>+	int ret;
>>+
>>+	ret =3D rproc_of_parse_firmware(dev, 0, &fw_name);
>>+	if (ret)
>>+		return dev_err_probe(dev, ret, "No firmware filename given\n");
>>+
>>+	rproc =3D devm_rproc_alloc(dev, dev_name(dev), &cv1800b_c906l_ops,
>>+				 fw_name, sizeof(*priv));
>>+	if (!rproc)
>>+		return dev_err_probe(dev, -ENOMEM,
>>+				     "unable to allocate remoteproc\n");
>>+
>>+	rproc->has_iommu =3D false;
>>+
>>+	priv =3D rproc->priv;
>>+	priv->dev =3D dev;
>>+	priv->rproc =3D rproc;
>>+
>>+	priv->syscon =3D syscon_regmap_lookup_by_phandle(np, "sophgo,syscon");
>>+	if (IS_ERR(priv->syscon))
>>+		return PTR_ERR(priv->syscon);
>>+
>>+	priv->reset =3D devm_reset_control_get_exclusive(dev, NULL);
>>+	if (IS_ERR(priv->reset))
>>+		return dev_err_probe(dev, PTR_ERR(priv->reset),
>>+				     "failed to get reset control handle\n");
>>+
>>+	platform_set_drvdata(pdev, rproc);
>>+
>>+	ret =3D devm_rproc_add(dev, rproc);
>>+	if (ret)
>>+		return dev_err_probe(dev, ret, "rproc_add failed\n");
>>+
>>+	return 0;
>>+}
>>+
>>+static void cv1800b_c906l_remove(struct platform_device *pdev)
>>+{
>>+	struct rproc *rproc =3D platform_get_drvdata(pdev);
>>+
>>+	if (atomic_read(&rproc->power) > 0)
>>+		rproc_shutdown(rproc);
>=20
> I think the remoteproc framework should block remove to be executed
> if 'power > 0'.  If not, the framework should be enhanced.

Okay. I realized that rproc_shutdown() will be called in rproc_del(), I
will remove rproc_shutdown() and only keep rproc_del()

>=20
> Regards,
> Peng

--=20
Best regards,
Junhui Liu

