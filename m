Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC15195C6D
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 18:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgC0RU0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 13:20:26 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:33625 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726515AbgC0RU0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 13:20:26 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RHHExC023340;
        Fri, 27 Mar 2020 18:20:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=QTSuuKZLP8ozbtRl/SbrJ5W4JDHdQ/hH7avSuWM4VcU=;
 b=o/8sviQhVFTMTEy2mftQ+94N4rogPA4YMfn5PvyMkmbznzVUxYKJU0Cc9eeut+OCMjDi
 5cS6nbwdcOpwM3kNHZjGDOVXOGMezNU8vYNAlua/DD8v6t64zrnyAC7GPLuU6ezUui1I
 iRlM5G6mEqX61kX2NEhzyvPFI5QCw77PeqNvQ3ICoOiOeaHEpNRiOHRE89GtZffC/cak
 /j7t3ntPSRK0YVOY6YsYDuHgcrRUXv7Taj0bdqdoSup9C5LsaIZhMS6ZFofQdeAhBYk8
 GJxpxBWTHeI+CUNk4NzXClApzxg5LIzwQLmfnu7G9WeK/tjCxhXwd9gzqwUGt25o3joA VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw9k0kc84-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 18:20:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8BE810002A;
        Fri, 27 Mar 2020 18:20:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C90D52BC7A3;
        Fri, 27 Mar 2020 18:20:14 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Mar
 2020 18:20:14 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 18:20:14 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH v2 00/17] remoteproc: Add support for synchronisation with
 MCU 
Thread-Topic: [PATCH v2 00/17] remoteproc: Add support for synchronisation
 with MCU 
Thread-Index: AQHWAiWg8CueXbuyYU+sQgKagKpF+qhcsWug
Date:   Fri, 27 Mar 2020 17:20:14 +0000
Message-ID: <4d264de6259449338cef9b2da1f39304@SFHDAG7NODE2.st.com>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
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
 definitions=2020-03-27_06:2020-03-27,2020-03-27 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: mardi 24 mars 2020 22:46
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH v2 00/17] remoteproc: Add support for synchronisation wit=
h
> MCU
>=20
> This is the second revision of this set that tries to address the
> problem of synchronising with an MCU with as much flexibility as
> possible.
>=20
> New in this revision is a fix for a couple of bugs I found while
> testing things.  First with the helper macro in patch 09 and the
> suppression of a boot message when synchronising with an MCU
> in patch 12.  I have completely removed what used to be patch 18,
> the example on how to use the new API.  This will be the subject
> of an upcoming patchset.
>=20
> Tested on ST's mp157c platform.  Applies on v5.6-rc7 to keep things
> simple.

Thanks Mathieu for the 2 series. I tested on my STM32MP157-DK2 the differen=
t
synchronization use cases (on_init, after_stop, after_crash), mixing the va=
lues and
I succeed to start/stop/restart M4 coprocessor with or without reloading fi=
rmware
according to sync values. (I only applied the correction I proposed in patc=
h 16 review
to allow to resync with a preloaded or an already running coprocessor.

Regards,
Loic
>=20
> Comments would be much appreciated.
>=20
> Thanks,
> Mathieu
>=20
> Mathieu Poirier (17):
>   remoteproc: Add new operation and state machine for MCU
>     synchronisation
>   remoteproc: Introduce function rproc_set_mcu_sync_state()
>   remoteproc: Split firmware name allocation from rproc_alloc()
>   remoteproc: Split rproc_ops allocation from rproc_alloc()
>   remoteproc: Get rid of tedious error path
>   remoteproc: Introduce function rproc_alloc_internals()
>   remoteproc: Introduce function rproc_alloc_state_machine()
>   remoteproc: Allocate synchronisation state machine
>   remoteproc: Call the right core function based on synchronisation
>     state
>   remoteproc: Decouple firmware load and remoteproc booting
>   remoteproc: Repurpose function rproc_trigger_auto_boot()
>   remoteproc: Rename function rproc_fw_boot()
>   remoteproc: Introducting new functions to start and stop an MCU
>   remoteproc: Refactor function rproc_trigger_recovery()
>   remoteproc: Correctly deal with MCU synchronisation when changing FW
>     image
>   remoteproc: Correctly deal with MCU synchronisation when changing
>     state
>   remoteproc: Make MCU synchronisation state changes on stop and crashed
>=20
>  drivers/remoteproc/remoteproc_core.c     | 387 ++++++++++++++++++-----
>  drivers/remoteproc/remoteproc_debugfs.c  |  31 ++
>  drivers/remoteproc/remoteproc_internal.h |  91 ++++--
>  drivers/remoteproc/remoteproc_sysfs.c    |  57 +++-
>  include/linux/remoteproc.h               |  28 +-
>  5 files changed, 487 insertions(+), 107 deletions(-)
>=20
> --
> 2.20.1

