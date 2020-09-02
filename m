Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A3D25B72D
	for <lists+linux-remoteproc@lfdr.de>; Thu,  3 Sep 2020 01:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgIBXOj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 2 Sep 2020 19:14:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:28542 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbgIBXOa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Sep 2020 19:14:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599088470; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=BLqR7N9u5o5zI0fu/U8Zok9Q7AX+5yZO+IccQf8/+pI=;
 b=XZ2yg8ALggbC5c6BccDVVbZQ0N3tlpQLQu9ZegTdnhbgjPjYvhpIHcyvssF0daRhZo3MAKOj
 8To46IGKYfXygj6vOZm5jduJCb34U6WdlVY+RfEHzi3/gjwOQEuvb/OE6E1zELpBfiO7suLX
 Yaull8m3A1KmgpPccTY/tPrN3PE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f50274d9f3347551f0f399c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Sep 2020 23:14:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4693CC433C6; Wed,  2 Sep 2020 23:14:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B5C8CC433C9;
        Wed,  2 Sep 2020 23:14:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 02 Sep 2020 16:14:19 -0700
From:   rishabhb@codeaurora.org
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Expose recovery/coredump configuration from sysfs
In-Reply-To: <20200901220542.GA121362@xps15>
References: <1598557731-1566-1-git-send-email-rishabhb@codeaurora.org>
 <20200901220542.GA121362@xps15>
Message-ID: <944061c55a14e28b2a200215c21a9c39@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2020-09-01 15:05, Mathieu Poirier wrote:
> Hi Rishabh,
> 
> On Thu, Aug 27, 2020 at 12:48:48PM -0700, Rishabh Bhatnagar wrote:
>> From Android R onwards Google has restricted access to debugfs in user
>> and user-debug builds. This restricts access to most of the features
>> exposed through debugfs. This patch series adds a configurable option
>> to move the recovery/coredump interfaces to sysfs. If the feature
>> flag is selected it would move these interfaces to sysfs and remove
>> the equivalent debugfs interface.
> 
> What I meant wast to move the coredump entry from debugfs to sysfs and 
> from
> there make it available to user space using a kernel config.  But 
> thinking
> further on this it may be better to simply provide an API to set the 
> coredump
> mode from the platform driver, the same way 
> rproc_coredump_set_elf_info() works.
> That will prevent breaking a fair amount of user space code...
> 
> Let me know if that can work for you.
> 
> Thanks,
> Mathieu
> 
Hi Mathieu,
That works for product configuration but that would still limit internal
testing. Since there is also restriction on accessing debugfs through
userspace code, automation won't be able to run recovery/coredump tests.
Only other way for us would be to provide these sysfs entries through 
the
platform drivers locally but that would create a lot of mess/redundancy.

>> 'Coredump' and 'Recovery' are critical
>> interfaces that are required for remoteproc to work on Qualcomm 
>> Chipsets.
>> Coredump configuration needs to be set to "inline" in debug/test build
>> and "disabled" in production builds. Whereas recovery needs to be
>> "disabled" for debugging purposes and "enabled" on production builds.
>> 
>> Changelog:
>> 
>> v1 -> v2:
>> - Correct the contact name in the sysfs documentation.
>> - Remove the redundant write documentation for coredump/recovery sysfs
>> - Add a feature flag to make this interface switch configurable.
>> 
>> Rishabh Bhatnagar (3):
>>   remoteproc: Expose remoteproc configuration through sysfs
>>   remoteproc: Add coredump configuration to sysfs
>>   remoteproc: Add recovery configuration to sysfs
>> 
>>  Documentation/ABI/testing/sysfs-class-remoteproc |  44 ++++++++
>>  drivers/remoteproc/Kconfig                       |  12 +++
>>  drivers/remoteproc/remoteproc_debugfs.c          |  10 +-
>>  drivers/remoteproc/remoteproc_sysfs.c            | 126 
>> +++++++++++++++++++++++
>>  4 files changed, 190 insertions(+), 2 deletions(-)
>> 
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
