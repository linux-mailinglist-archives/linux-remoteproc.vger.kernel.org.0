Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6AF19584E
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 14:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgC0Nre (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 09:47:34 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:12376 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726275AbgC0Nrd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 09:47:33 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RDggQA011571;
        Fri, 27 Mar 2020 14:47:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=VWobv5IWH3bg/f/18v5c6x3DmkdI6UFi+5Lg9XjFFw0=;
 b=Bdm7Zo0Id9Bp91ebNuBcZLXl31LUqCKVoSF/sjnQSubfcYXKXgA7UmF4ZSDyjBqqXdzO
 Fo+CgStsIGJKJRoVCk+DeAHI1/TddODNplTrG1B2o5eolypZZQmFYVyFdC/6+dF5SadD
 dlFxr6MAnHhCMwVSzEVz9xok70Gkhj0JXqK6T73i1xHihabDzwF7OwQC/JRdHMiuvA1u
 yPLxuMPRT/nBCJ+e3DPGPvH8wUTnxN+YGIBGB791y4zKRbhwPGTwEucDLOBd2KGlQdy8
 3Q49P2DnY3ukr+QelF5YvmbEu2dJVoceQcIgYJb9vdtQcSqta3ehxT8kDA2R7iFbRkK+ SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw8xejscx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 14:47:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A7579100034;
        Fri, 27 Mar 2020 14:47:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97EDD2AD2C4;
        Fri, 27 Mar 2020 14:47:21 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Mar
 2020 14:47:21 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 14:47:21 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH v2 08/17] remoteproc: Allocate synchronisation state
 machine
Thread-Topic: [PATCH v2 08/17] remoteproc: Allocate synchronisation state
 machine
Thread-Index: AQHWAiWluM552bwBy02mfz22xaba9Khcbofw
Date:   Fri, 27 Mar 2020 13:47:21 +0000
Message-ID: <e89d9859f4324cf59b0ae6787775d8f5@SFHDAG7NODE2.st.com>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-9-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-9-mathieu.poirier@linaro.org>
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
> Subject: [PATCH v2 08/17] remoteproc: Allocate synchronisation state
> machine
>=20
> This patch allocates a synchronisation state machine, either provided or
> not by users, in order to enact the proper behavior requested by the
> platform or specific scenarios.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 59
> +++++++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 02dbb826aa29..1578a9c70422 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1955,6 +1955,7 @@ static void rproc_type_release(struct device *dev)
>  	kfree(rproc->firmware);
>  	kfree(rproc->ops);
>  	kfree(rproc->sync_ops);
> +	kfree(rproc->sync_states);
>  	kfree(rproc);
>  }
>=20
> @@ -2035,6 +2036,59 @@ static int rproc_alloc_sync_ops(struct rproc *rpro=
c,
>  	return 0;
>  }
>=20
> +static int rproc_alloc_sync_states(struct rproc *rproc,
> +				   const struct rproc_ops *boot_ops,
> +				   const struct rproc_ops *sync_ops,
> +				   struct rproc_sync_states *sync_states)
> +{
> +	struct rproc_sync_states *st;
> +
> +	/* At least one set of operation is needed */
> +	if (!boot_ops && !sync_ops)
> +		return -EINVAL;
> +
> +	/* We have a synchronisation state machine, no need to build one */
> +	if (sync_states) {
> +		st =3D kmemdup(sync_states, sizeof(*st), GFP_KERNEL);
> +		if (!st)
> +			return -ENOMEM;
> +

I think a check between sync_states and boot_ops/sync_ops may be needed her=
e
even if it is platform driver responsibility to provide coherent configurat=
ion
As soon as one of the sync_states is set at true, sync_ops must be provided
As soon as one of the sync_states is set at false, boot_ops must be provide=
d

Regards,
Loic

> +		/* Nothing else to do */
> +		goto out;
> +	}
> +
> +	/* Allocate synchronisation state machine */
> +	st =3D kzalloc(sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return -ENOMEM;
> +
> +	/*
> +	 * We have a boot_ops and no sync_ops - build a state machine that
> +	 * does _not_ synchronise with an MCU.
> +	 */
> +	if (boot_ops && !sync_ops) {
> +		st->on_init =3D st->after_stop =3D st->after_crash =3D false;
> +		goto out;
> +	}
> +
> +	/*
> +	 * We have a sync_ops and an no boot_ops - build a state machine
> that
> +	 * _only_ synchronises with an MCU.
> +	 */
> +	if (sync_ops && !boot_ops) {
> +		st->on_init =3D st->after_stop =3D st->after_crash =3D true;
> +		goto out;
> +	}
> +
> +out:
> +	rproc->sync_with_mcu =3D st->on_init;
> +	/* And the synchronisation state machine to use */
> +	rproc->sync_states =3D st;
> +	/* Tell the core what to do when initialising */
> +	rproc_set_mcu_sync_state(rproc, RPROC_SYNC_STATE_INIT);
> +	return 0;
> +}
> +
>  static int rproc_alloc_internals(struct rproc *rproc, const char *name,
>  				 const struct rproc_ops *boot_ops,
>  				 const struct rproc_ops *sync_ops,
> @@ -2065,7 +2119,10 @@ static int rproc_alloc_internals(struct rproc *rpr=
oc,
> const char *name,
>  			return ret;
>  	}
>=20
> -	return 0;
> +	/* Finally allocate the synchronisation state machine */
> +	ret =3D rproc_alloc_sync_states(rproc, boot_ops, sync_ops,
> sync_states);
> +
> +	return ret;
>  }
>=20
>  /**
> --
> 2.20.1

