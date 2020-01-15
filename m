Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B34D13CEAB
	for <lists+linux-remoteproc@lfdr.de>; Wed, 15 Jan 2020 22:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729661AbgAOVQK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 15 Jan 2020 16:16:10 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:59982 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729134AbgAOVQK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Jan 2020 16:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1579122967; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jKAektEMk3dDvQFgHsowwSKIu5ew5qUHWRblTQXzHFw=;
        b=Zni2LUe8aCzgd+JjU/p68g5Vnt8ezP3ky8vYPVLMTdje6sEpYv118/+EzsMcBHF+3x09PG
        AQoYRruV4gmCmlEBP4vEdNaRoIv030EFNfnDuKSegIPBUgOVdxx4nIsV8s/WXj+mMZGKhq
        GZwqCMna33m+D4kXeSOoMm5VX3LSsV4=
Date:   Wed, 15 Jan 2020 18:15:51 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 3/5] remoteproc: Add prepare/unprepare callbacks
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <1579122951.3.2@crapouillou.net>
In-Reply-To: <20191221202039.GG549437@yoga>
References: <20191210164014.50739-1-paul@crapouillou.net>
        <20191210164014.50739-3-paul@crapouillou.net> <20191221202039.GG549437@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,


Le sam., d=E9c. 21, 2019 at 12:20, Bjorn Andersson=20
<bjorn.andersson@linaro.org> a =E9crit :
> On Tue 10 Dec 08:40 PST 2019, Paul Cercueil wrote:
>=20
>>  The .prepare() callback is called before the firmware is loaded to
>>  memory. This is useful for instance in the case where some setup is
>>  required for the memory to be accessible.
>>=20
>=20
> Would it make sense to somehow tie this prepare/unprepare to the=20
> actual
> struct rproc_mem_entry that needs the resource enabled?

Do you need such granularity?

In my case, the three memories need the same clock to be enabled.

-Paul


>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>=20
>>  Notes:
>>      v2-v4: No change
>>=20
>>   drivers/remoteproc/remoteproc_core.c | 16 +++++++++++++++-
>>   include/linux/remoteproc.h           |  4 ++++
>>   2 files changed, 19 insertions(+), 1 deletion(-)
>>=20
>>  diff --git a/drivers/remoteproc/remoteproc_core.c=20
>> b/drivers/remoteproc/remoteproc_core.c
>>  index 0a9fc7fdd1c3..3ea5f675a148 100644
>>  --- a/drivers/remoteproc/remoteproc_core.c
>>  +++ b/drivers/remoteproc/remoteproc_core.c
>>  @@ -1299,11 +1299,19 @@ static int rproc_start(struct rproc *rproc,=20
>> const struct firmware *fw)
>>   	struct device *dev =3D &rproc->dev;
>>   	int ret;
>>=20
>>  +	if (rproc->ops->prepare) {
>>  +		ret =3D rproc->ops->prepare(rproc);
>>  +		if (ret) {
>>  +			dev_err(dev, "Failed to prepare rproc: %d\n", ret);
>>  +			return ret;
>>  +		}
>>  +	}
>>  +
>>   	/* load the ELF segments to memory */
>>   	ret =3D rproc_load_segments(rproc, fw);
>>   	if (ret) {
>>   		dev_err(dev, "Failed to load program segments: %d\n", ret);
>>  -		return ret;
>>  +		goto unprepare_rproc;
>>   	}
>>=20
>>   	/*
>>  @@ -1354,6 +1362,9 @@ static int rproc_start(struct rproc *rproc,=20
>> const struct firmware *fw)
>>   	rproc_unprepare_subdevices(rproc);
>>   reset_table_ptr:
>>   	rproc->table_ptr =3D rproc->cached_table;
>>  +unprepare_rproc:
>>  +	if (rproc->ops->unprepare)
>>  +		rproc->ops->unprepare(rproc);
>>=20
>>   	return ret;
>>   }
>>  @@ -1483,6 +1494,9 @@ static int rproc_stop(struct rproc *rproc,=20
>> bool crashed)
>>=20
>>   	rproc->state =3D RPROC_OFFLINE;
>>=20
>>  +	if (rproc->ops->unprepare)
>>  +		rproc->ops->unprepare(rproc);
>>  +
>>   	dev_info(dev, "stopped remote processor %s\n", rproc->name);
>>=20
>>   	return 0;
>>  diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>  index 5f201f0c86c3..a6272d1ba384 100644
>>  --- a/include/linux/remoteproc.h
>>  +++ b/include/linux/remoteproc.h
>>  @@ -355,6 +355,8 @@ enum rsc_handling_status {
>>=20
>>   /**
>>    * struct rproc_ops - platform-specific device handlers
>>  + * @prepare:	prepare the device for power up (before the firmware=20
>> is loaded)
>>  + * @unprepare:	unprepare the device after it is stopped
>>    * @start:	power on the device and boot it
>>    * @stop:	power off the device
>>    * @kick:	kick a virtqueue (virtqueue id given as a parameter)
>>  @@ -371,6 +373,8 @@ enum rsc_handling_status {
>>    * @get_boot_addr:	get boot address to entry point specified in=20
>> firmware
>>    */
>>   struct rproc_ops {
>>  +	int (*prepare)(struct rproc *rproc);
>>  +	void (*unprepare)(struct rproc *rproc);
>>   	int (*start)(struct rproc *rproc);
>>   	int (*stop)(struct rproc *rproc);
>>   	void (*kick)(struct rproc *rproc, int vqid);
>>  --
>>  2.24.0
>>=20

=

