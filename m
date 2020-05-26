Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAAF1DEDE5
	for <lists+linux-remoteproc@lfdr.de>; Fri, 22 May 2020 19:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730471AbgEVRL1 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 22 May 2020 13:11:27 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:35740 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbgEVRL1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 May 2020 13:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1590167484; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Gq9F8lTkEQt8HCBJpWq1zgbA3UBCjpb+tJXX07K3abw=;
        b=uH1Nu4HKVUV+dQbqHI0J7ym58RSoZ7n9YQVSBw/B7bhKwwY0kLpT6qtzuvmi3oYIr16caq
        8/hwvnUA8TuV921HAfmb82AWCBP2+/AfAughZNLK4EG80nkbndH/3SBgL6r5Md5xFt+KrP
        28UPaHN1haC7FwP4u29+AfqnavXO17s=
Date:   Fri, 22 May 2020 19:11:13 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 3/5] remoteproc: Add support for runtime PM
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Message-Id: <P2TQAQ.3VDG3B8W2EPF3@crapouillou.net>
In-Reply-To: <035bf8ad-3ef0-8314-ae5c-a94a24c230c8@ti.com>
References: <20200515104340.10473-1-paul@crapouillou.net>
        <20200515104340.10473-3-paul@crapouillou.net>
        <035bf8ad-3ef0-8314-ae5c-a94a24c230c8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Suman,

Le ven. 22 mai 2020 =E0 11:47, Suman Anna <s-anna@ti.com> a =E9crit :
> Hi Paul,
>=20
> On 5/15/20 5:43 AM, Paul Cercueil wrote:
>> Call pm_runtime_get_sync() before the firmware is loaded, and
>> pm_runtime_put() after the remote processor has been stopped.
>>=20
>> Even though the remoteproc device has no PM callbacks, this allows=20
>> the
>> parent device's PM callbacks to be properly called.
>=20
> I see this patch staged now for 5.8, and the latest -next branch has=20
> broken the pm-runtime autosuspend feature we have in the OMAP=20
> remoteproc driver. See commit 5f31b232c674 ("remoteproc/omap: Add=20
> support for runtime auto-suspend/resume").
>=20
> What was the original purpose of this patch, because there can be=20
> differing backends across different SoCs.

Did you try pm_suspend_ignore_children()? It looks like it was made for=20
your use-case.

Cheers,
-Paul

>=20
> regards
> Suman
>=20
>>=20
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>=20
>> Notes:
>>      v2-v4: No change
>>      v5: Move calls to prepare/unprepare to=20
>> rproc_fw_boot/rproc_shutdown
>>      v6: Instead of prepare/unprepare callbacks, use PM runtime=20
>> callbacks
>>      v7: Check return value of pm_runtime_get_sync()
>>=20
>>   drivers/remoteproc/remoteproc_core.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/remoteproc/remoteproc_core.c=20
>> b/drivers/remoteproc/remoteproc_core.c
>> index a7f96bc98406..e33d1ef27981 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -29,6 +29,7 @@
>>   #include <linux/devcoredump.h>
>>   #include <linux/rculist.h>
>>   #include <linux/remoteproc.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/iommu.h>
>>   #include <linux/idr.h>
>>   #include <linux/elf.h>
>> @@ -1382,6 +1383,12 @@ static int rproc_fw_boot(struct rproc *rproc,=20
>> const struct firmware *fw)
>>   	if (ret)
>>   		return ret;
>>   =7F+	ret =3D pm_runtime_get_sync(dev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "pm_runtime_get_sync failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>   	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
>>   =7F  	/*
>> @@ -1391,7 +1398,7 @@ static int rproc_fw_boot(struct rproc *rproc,=20
>> const struct firmware *fw)
>>   	ret =3D rproc_enable_iommu(rproc);
>>   	if (ret) {
>>   		dev_err(dev, "can't enable iommu: %d\n", ret);
>> -		return ret;
>> +		goto put_pm_runtime;
>>   	}
>>   =7F  	rproc->bootaddr =3D rproc_get_boot_addr(rproc, fw);
>> @@ -1435,6 +1442,8 @@ static int rproc_fw_boot(struct rproc *rproc,=20
>> const struct firmware *fw)
>>   	rproc->table_ptr =3D NULL;
>>   disable_iommu:
>>   	rproc_disable_iommu(rproc);
>> +put_pm_runtime:
>> +	pm_runtime_put(dev);
>>   	return ret;
>>   }
>>   =7F@@ -1840,6 +1849,8 @@ void rproc_shutdown(struct rproc *rproc)
>>   =7F  	rproc_disable_iommu(rproc);
>>   =7F+	pm_runtime_put(dev);
>> +
>>   	/* Free the copy of the resource table */
>>   	kfree(rproc->cached_table);
>>   	rproc->cached_table =3D NULL;
>> @@ -2118,6 +2129,9 @@ struct rproc *rproc_alloc(struct device *dev,=20
>> const char *name,
>>   =7F  	rproc->state =3D RPROC_OFFLINE;
>>   =7F+	pm_runtime_no_callbacks(&rproc->dev);
>> +	pm_runtime_enable(&rproc->dev);
>> +
>>   	return rproc;
>>   }
>>   EXPORT_SYMBOL(rproc_alloc);
>> @@ -2133,6 +2147,7 @@ EXPORT_SYMBOL(rproc_alloc);
>>    */
>>   void rproc_free(struct rproc *rproc)
>>   {
>> +	pm_runtime_disable(&rproc->dev);
>>   	put_device(&rproc->dev);
>>   }
>>   EXPORT_SYMBOL(rproc_free);
>>=20
>=20


