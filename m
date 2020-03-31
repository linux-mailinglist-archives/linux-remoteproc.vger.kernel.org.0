Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58DDE19A21A
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Apr 2020 00:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbgCaWvw (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 31 Mar 2020 18:51:52 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58646 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbgCaWvw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 Mar 2020 18:51:52 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02VMpiun099119;
        Tue, 31 Mar 2020 17:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585695104;
        bh=9I4cCc1SgE42RHC5aJ1yx86MMxf4TNo16ftyvS58EE4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ems31SUqageRlfAFvQyajePUVxcueAe0RtrpRf47ioUjT31DIHUieUWqso2WlhXlW
         MEmFElvEzl3CePjVSJ6O1zablbZtdyNbSY6HhHKJ/+tyKIAwIsDM0ieRAfDX+luy9f
         kF/QQLLsGJzv7kBRkj0LVMW33maInHFNLG6DrZMA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02VMpiZq104180
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 31 Mar 2020 17:51:44 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 31
 Mar 2020 17:51:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 31 Mar 2020 17:51:44 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02VMpi9V101374;
        Tue, 31 Mar 2020 17:51:44 -0500
Subject: Re: [PATCH v2 00/17] remoteproc: Add support for synchronisation with
 MCU
To:     Loic PALLARDY <loic.pallardy@st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <4d264de6259449338cef9b2da1f39304@SFHDAG7NODE2.st.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <172c8ba5-f365-5e63-cc39-94dfe1bafa9f@ti.com>
Date:   Tue, 31 Mar 2020 17:51:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4d264de6259449338cef9b2da1f39304@SFHDAG7NODE2.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 3/27/20 12:20 PM, Loic PALLARDY wrote:
> Hi Mathieu,
> 
>>
>> This is the second revision of this set that tries to address the
>> problem of synchronising with an MCU with as much flexibility as
>> possible.
>>
>> New in this revision is a fix for a couple of bugs I found while
>> testing things.  First with the helper macro in patch 09 and the
>> suppression of a boot message when synchronising with an MCU
>> in patch 12.  I have completely removed what used to be patch 18,
>> the example on how to use the new API.  This will be the subject
>> of an upcoming patchset.
>>
>> Tested on ST's mp157c platform.  Applies on v5.6-rc7 to keep things
>> simple.
> 
> Thanks Mathieu for the 2 series. I tested on my STM32MP157-DK2 the different
> synchronization use cases (on_init, after_stop, after_crash), mixing the values and
> I succeed to start/stop/restart M4 coprocessor with or without reloading firmware
> according to sync values. (I only applied the correction I proposed in patch 16 review
> to allow to resync with a preloaded or an already running coprocessor.
> 
> Regards,
> Loic
>>
>> Comments would be much appreciated.

Thank you for the enhanced series to implement the logic in remoteproc
core. I have provided my comments on most of the patches.

Overall, I can see my early-boot scenarios work with the series, and the
slightly different userspace-loading support usecase would need some
additional support.

As I commented on patch 1 in v1, I would rather reuse the the generic
"rproc" instead of adding a new "mcu" terminology to code.. Let's just
stick with the rproc

Another thing I would prefer (echoing my comments on patch 7) is to just
use an API for modifying the sync states, that can be used between
rproc_alloc() and rproc_add(). The state-machine really doesn't kick in
until rproc_add() is invoked. The memory for the driver private rproc
structure is allocated using rproc_alloc() normally, and most of the
DT-parsing in platform drivers is generally done directly into this
allocated memory. I see it a bit cumbersome having to maintain a
separate structure, and then do a memcpy, especially given that the
rproc_alloc_state_machine() logic requires that you detect the state
before calling the rproc_alloc().

regards
Suman

>>
>> Thanks,
>> Mathieu
>>
>> Mathieu Poirier (17):
>>   remoteproc: Add new operation and state machine for MCU
>>     synchronisation
>>   remoteproc: Introduce function rproc_set_mcu_sync_state()
>>   remoteproc: Split firmware name allocation from rproc_alloc()
>>   remoteproc: Split rproc_ops allocation from rproc_alloc()
>>   remoteproc: Get rid of tedious error path
>>   remoteproc: Introduce function rproc_alloc_internals()
>>   remoteproc: Introduce function rproc_alloc_state_machine()
>>   remoteproc: Allocate synchronisation state machine
>>   remoteproc: Call the right core function based on synchronisation
>>     state
>>   remoteproc: Decouple firmware load and remoteproc booting
>>   remoteproc: Repurpose function rproc_trigger_auto_boot()
>>   remoteproc: Rename function rproc_fw_boot()
>>   remoteproc: Introducting new functions to start and stop an MCU
>>   remoteproc: Refactor function rproc_trigger_recovery()
>>   remoteproc: Correctly deal with MCU synchronisation when changing FW
>>     image
>>   remoteproc: Correctly deal with MCU synchronisation when changing
>>     state
>>   remoteproc: Make MCU synchronisation state changes on stop and crashed
>>
>>  drivers/remoteproc/remoteproc_core.c     | 387 ++++++++++++++++++-----
>>  drivers/remoteproc/remoteproc_debugfs.c  |  31 ++
>>  drivers/remoteproc/remoteproc_internal.h |  91 ++++--
>>  drivers/remoteproc/remoteproc_sysfs.c    |  57 +++-
>>  include/linux/remoteproc.h               |  28 +-
>>  5 files changed, 487 insertions(+), 107 deletions(-)
>>
>> --
>> 2.20.1
> 

