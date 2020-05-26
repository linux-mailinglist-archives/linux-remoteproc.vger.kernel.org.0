Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137AC1ADE92
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2020 15:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730639AbgDQNjl (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Apr 2020 09:39:41 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53478 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730601AbgDQNjl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Apr 2020 09:39:41 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03HDdeRH015568;
        Fri, 17 Apr 2020 08:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587130780;
        bh=fPD7MjAH07jW+fEPJODiq0aSCODnUc4TTAiODapki5k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mky1tXWUtuoTqtXlDkGEYI843/05K8sxov+98LXDrTW8Y6GgjLi8qGwbYcXjfrF0v
         q6EvXqxKi1VO7au2KlOl3s5UV52P5FDXNKIh1hzefZc3YM848dQfsy/kHehRwZdoyh
         wqFOH1QkvIDRtzYccCVvRNehXIu9x8u9iyLrbS1E=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03HDdet9125510
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Apr 2020 08:39:40 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Apr 2020 08:39:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Apr 2020 08:39:40 -0500
Received: from [10.250.48.148] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HDdd45106528;
        Fri, 17 Apr 2020 08:39:39 -0500
Subject: Re: [PATCH v2 5/7] remoteproc: Restructure firmware name allocation
To:     Markus Elfring <Markus.Elfring@web.de>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, Alex Elder <elder@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-6-mathieu.poirier@linaro.org>
 <aa565fea-b1c4-9b5c-73ed-591244afee19@web.de>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <e887c990-8cba-62b0-0f47-3ea0c166d603@ti.com>
Date:   Fri, 17 Apr 2020 08:39:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aa565fea-b1c4-9b5c-73ed-591244afee19@web.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Markus,

On 4/16/20 1:26 AM, Markus Elfring wrote:
> …
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1984,14 +1984,14 @@ static int rproc_alloc_firmware(struct rproc *rproc,
>>   {
>>   	const char *p;
>>
>> -	if (!firmware)
>> +	if (firmware)
>> +		p = kstrdup_const(firmware, GFP_KERNEL);
>> +	else
>>   		/*
>>   		 * If the caller didn't pass in a firmware name then
>>   		 * construct a default name.
>>   		 */
>>   		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
>> -	else
>> -		p = kstrdup_const(firmware, GFP_KERNEL);
> 
> Can the use of the conditional operator make sense at such source code places?
> 
> 	p = firmware ? kstrdup_const(…) : kasprintf(…);

For simple assignments, I too prefer the ternary operator, but in this 
case, I think it is better to leave the current code as is.

regards
Suman
