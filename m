Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA4B319585E
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 14:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbgC0Nuc (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 09:50:32 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:52606 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727185AbgC0Nuc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 09:50:32 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RDm7Wn020462;
        Fri, 27 Mar 2020 14:50:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=t760OhRi+K70XRQp0+HuMpCif0p6Xlm8k46BDYZdjBs=;
 b=N/kb5dtDVtPzQ046dzNd41+CZ0LmtR5XrTCTLbkf/XmxY/z6Sj8f0O82y9DTztWZf6OB
 csUZ6cyB9exG2mmQDr647ZQ7DOzZ7Wx1Yhs8jxt1Cap0z1z98iayvz/hthgKme6TYzta
 vct3BgaASiSzi/KpZls7BbL+s6+zvKo9a9252ARjma879x7zrGQ9BewfT4Ip/xN7fJep
 4fQDDMzO1tttfAxQeXeoFgk1CCAFM5ztEA61gK5pci5vIEAvNX210waivtewnbIHcc+v
 VJ2juwYvI0weThl4mtBkUtuMezfFMlKOKvs5m9QEV+lOZrXPebkMOnKsfzLjfEjqPiZg oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw9962dvy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 14:50:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94070100034;
        Fri, 27 Mar 2020 14:50:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 82F2A2AD2CE;
        Fri, 27 Mar 2020 14:50:18 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 27 Mar
 2020 14:50:18 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 14:50:18 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
 synchronisation when changing FW image
Thread-Topic: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
 synchronisation when changing FW image
Thread-Index: AQHWAiWpPAmQORjnx0+KHiZcs72N+6hceKnw
Date:   Fri, 27 Mar 2020 13:50:18 +0000
Message-ID: <91d38ff6a39f4e07838d1e85c392eb8f@SFHDAG7NODE2.st.com>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-16-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-16-mathieu.poirier@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-27_04:2020-03-27,2020-03-27 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: mardi 24 mars 2020 22:46
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
> synchronisation when changing FW image
>=20
> This patch prevents the firmware image from being displayed or changed
> when
> the remoteproc core is synchronising with an MCU. This is needed since
> there is no guarantee about the nature of the firmware image that is load=
ed
> by the external entity.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 25
> ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> b/drivers/remoteproc/remoteproc_sysfs.c
> index 7f8536b73295..4956577ad4b4 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -13,9 +13,20 @@
>  static ssize_t firmware_show(struct device *dev, struct device_attribute
> *attr,
>  			  char *buf)
>  {
> +	ssize_t ret;
>  	struct rproc *rproc =3D to_rproc(dev);
>=20
> -	return sprintf(buf, "%s\n", rproc->firmware);
> +	/*
> +	 * In most instances there is no guarantee about the firmware
> +	 * that was loaded by the external entity.  As such simply don't
> +	 * print anything.
> +	 */
> +	if (rproc_sync_with_mcu(rproc))
> +		ret =3D sprintf(buf, "\n");
Is it enough to provide empty name, or should we add a message to indicate =
that's name is unkown/undefined ?

Regards,
Loic
> +	else
> +		ret =3D sprintf(buf, "%s\n", rproc->firmware);
> +
> +	return ret;
>  }
>=20
>  /* Change firmware name via sysfs */
> @@ -33,6 +44,18 @@ static ssize_t firmware_store(struct device *dev,
>  		return -EINVAL;
>  	}
>=20
> +	/*
> +	 * There is no point in trying to change the firmware if the MCU
> +	 * is currently running or if loading of the image is done by
> +	 * another entity.
> +	 */
> +	if (rproc_sync_with_mcu(rproc)) {
> +		dev_err(dev,
> +			"can't change firmware while synchronising with
> MCU\n");
> +		err =3D -EBUSY;
> +		goto out;
> +	}
> +
>  	if (rproc->state !=3D RPROC_OFFLINE) {
>  		dev_err(dev, "can't change firmware while running\n");
>  		err =3D -EBUSY;
> --
> 2.20.1

