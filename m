Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A68223F585
	for <lists+linux-remoteproc@lfdr.de>; Sat,  8 Aug 2020 02:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgHHAd4 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 7 Aug 2020 20:33:56 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63274 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726159AbgHHAd4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Aug 2020 20:33:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596846835; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=o8H3DbBRuU/WI60t8r75/8BmV4S5ZGXxpDud+ZI36N8=; b=fYEmAxIOLWp9uVmGg08iWTVy/jpoepGuftQQ0JOZ934K5TPUPViZts7BM6K435JZFBcpTlYO
 PqoB/kBK0KngakgJjpdC8mp5HarKmf2s+nn9XK0Vn36Y459oWhJEk0bcuFzuQr0eZokSFVEt
 heDQlxo6G/jKaNR9vanPtpCICIw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5f2df2f3ba4c2cd367d04a81 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 08 Aug 2020 00:33:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA2CCC433CA; Sat,  8 Aug 2020 00:33:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.142.6] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: clew)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B625AC433C6;
        Sat,  8 Aug 2020 00:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B625AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=clew@codeaurora.org
Subject: Re: [PATCH V7 2/4] rpmsg: Guard against null endpoint ops in destroy
To:     Greg KH <gregkh@linuxfoundation.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        "open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <1593017121-7953-1-git-send-email-deesin@codeaurora.org>
 <1593017121-7953-3-git-send-email-deesin@codeaurora.org>
 <20200807075946.GA3049898@kroah.com>
From:   Chris Lew <clew@codeaurora.org>
Message-ID: <e7fc6957-5065-9dbc-2f2d-d24893fead63@codeaurora.org>
Date:   Fri, 7 Aug 2020 17:33:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200807075946.GA3049898@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Greg,

On 8/7/2020 12:59 AM, Greg KH wrote:
> On Wed, Jun 24, 2020 at 10:15:19PM +0530, Deepak Kumar Singh wrote:
>> From: Chris Lew <clew@codeaurora.org>
>>
>> In RPMSG GLINK the chrdev device will allocate an ept as part of the
>> rpdev creation. This device will not register endpoint ops even though
>> it has an allocated ept. Protect against the case where the device is
>> being destroyed.
>>
>> Signed-off-by: Chris Lew <clew@codeaurora.org>
>> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
>> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> 
> Should this be marked for stable kernels?
> 
> And if so, what commit does this fix?  Any reason the Fixes: tag was not
> used here?
> 

The crash that this fixes doesn't show up unless one of the previous 
patches in the series is applied.

[PATCH V6 3/5] rpmsg: glink: Add support for rpmsg glink chrdev

I'm not sure if the fixes tag should apply to this change or one of the 
commits to the base rpmsg code.

> And what happened to this series?  I don't see it in linux-next, did the
> maintainer ignore it?
> 

I believe most of the review feedback for the series has been addressed 
by Deepak. There is one remaining action item for me and Deepak to 
provide more concrete evidence that the first patch in the series is 
needed.

[PATCH V6 1/5] rpmsg: glink: Use complete_all for open states

> thanks,
> 
> greg k-h
> 

Thanks,
Chris

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
