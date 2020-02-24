Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA7A16A9FD
	for <lists+linux-remoteproc@lfdr.de>; Mon, 24 Feb 2020 16:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbgBXPZe (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 24 Feb 2020 10:25:34 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:39764 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727539AbgBXPZd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 24 Feb 2020 10:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582557931; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SmPgy2zJNFt//FFDsKzJvPnH2D7WIJX2Um97SB6yv+c=;
        b=LFgcDy1+ROVN5JpGz88s8QhlbuOHE3h8ALc+Z9060O/Mrdqm+FEkrgUqWw1BJ05pUgReqH
        AZu/manhY5V9y5dnsMJkCN5mbesaJWCIctAsJBznYNr2lo3BsQ92JTRnzbbegS3BODcoPD
        ufIDouoowNNxWM0auRjpUlLpA4sVhUw=
Date:   Mon, 24 Feb 2020 12:25:14 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 3/5] remoteproc: Add prepare/unprepare callbacks
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <1582557914.3.1@crapouillou.net>
In-Reply-To: <daf58c35-c240-e50a-da50-48b14c0e097c@st.com>
References: <20200211142614.13567-1-paul@crapouillou.net>
        <20200211142614.13567-3-paul@crapouillou.net>
        <daf58c35-c240-e50a-da50-48b14c0e097c@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,


Le mar., f=E9vr. 18, 2020 at 17:31, Arnaud POULIQUEN=20
<arnaud.pouliquen@st.com> a =E9crit :
> Hi Paul,
>=20
> I still wonder about the use of pm_runtime mechanism as a more=20
> generic alternative...

The use of pm_runtime is perfect if CONFIG_PM is enabled, but otherwise=20
it's a bit cumbersome, as the clocks must be enabled in the probe.

-Paul

> Else just a minor remark inline.
>=20
> On 2/11/20 3:26 PM, Paul Cercueil wrote:
>>  The .prepare() callback is called before the firmware is loaded to
>>  memory. This is useful for instance in the case where some setup is
>>  required for the memory to be accessible.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>=20
>>  Notes:
>>      v2-v4: No change
>>      v5: Move calls to prepare/unprepare to=20
>> rproc_fw_boot/rproc_shutdown
>>=20
>>   drivers/remoteproc/remoteproc_core.c | 16 +++++++++++++++-
>>   include/linux/remoteproc.h           |  4 ++++
>>   2 files changed, 19 insertions(+), 1 deletion(-)
>>=20
>>  diff --git a/drivers/remoteproc/remoteproc_core.c=20
>> b/drivers/remoteproc/remoteproc_core.c
>>  index fe5c7a2f9767..022b927e176b 100644
>>  --- a/drivers/remoteproc/remoteproc_core.c
>>  +++ b/drivers/remoteproc/remoteproc_core.c
>>  @@ -1373,6 +1373,14 @@ static int rproc_fw_boot(struct rproc=20
>> *rproc, const struct firmware *fw)
>>=20
>>   	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
>>=20
>>  +	if (rproc->ops->prepare) {
>>  +		ret =3D rproc->ops->prepare(rproc);
>>  +		if (ret) {
>>  +			dev_err(dev, "Failed to prepare rproc: %d\n", ret);
>>  +			return ret;
>>  +		}
>>  +	}
>>  +
>>   	/*
>>   	 * if enabling an IOMMU isn't relevant for this rproc, this is
>>   	 * just a nop
>>  @@ -1380,7 +1388,7 @@ static int rproc_fw_boot(struct rproc *rproc,=20
>> const struct firmware *fw)
>>   	ret =3D rproc_enable_iommu(rproc);
>>   	if (ret) {
>>   		dev_err(dev, "can't enable iommu: %d\n", ret);
>>  -		return ret;
>>  +		goto unprepare_rproc;
>>   	}
>>=20
>>   	rproc->bootaddr =3D rproc_get_boot_addr(rproc, fw);
>>  @@ -1424,6 +1432,9 @@ static int rproc_fw_boot(struct rproc *rproc,=20
>> const struct firmware *fw)
>>   	rproc->table_ptr =3D NULL;
>>   disable_iommu:
>>   	rproc_disable_iommu(rproc);
>>  +unprepare_rproc:
>>  +	if (rproc->ops->unprepare)
>>  +		rproc->ops->unprepare(rproc);
>>   	return ret;
>>   }
>>=20
>>  @@ -1823,6 +1834,9 @@ void rproc_shutdown(struct rproc *rproc)
>>=20
>>   	rproc_disable_iommu(rproc);
>>=20
>>  +	if (rproc->ops->unprepare)
>>  +		rproc->ops->unprepare(rproc);
>>  +
>>   	/* Free the copy of the resource table */
>>   	kfree(rproc->cached_table);
>>   	rproc->cached_table =3D NULL;
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
>=20
> Would be nice here to precise that these functions are optional
> you can look at rproc_ops struct for example.
>=20
> Regards,
> Arnaud
>=20
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
>>=20

=

