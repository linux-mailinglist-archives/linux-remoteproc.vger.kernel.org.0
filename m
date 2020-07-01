Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10DD21140B
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Jul 2020 22:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbgGAUKj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 1 Jul 2020 16:10:39 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:40699 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725915AbgGAUKj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Jul 2020 16:10:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593634238; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FTeCKQGXFfOKKmEYSpjvJeelLTqTHx/vRZNpqPIrxno=;
 b=kJPepvyGX3LsHbMlqjZhoYGIwiZ6UpPtjatlI0B2J0x22vAKnSE8Ax82Z2l0zmxFlPSw7vRa
 cUO/K9Sp4CTAFrc6yrqf9d0FU+Xwekd6ONzwNMF4xK/nii+JcrXIwKyuq349wTZ/E5Fkkprd
 lbmS4LQi1RZxoxlgfnSMDHifveQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5efcedb90206ad41d1a16650 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Jul 2020 20:10:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A88D3C433CB; Wed,  1 Jul 2020 20:10:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 326B8C433C6;
        Wed,  1 Jul 2020 20:10:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 02 Jul 2020 01:40:32 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v6 1/3] remoteproc: Move coredump functionality to a new
 file
In-Reply-To: <1593460933-4262-2-git-send-email-rishabhb@codeaurora.org>
References: <1593460933-4262-1-git-send-email-rishabhb@codeaurora.org>
 <1593460933-4262-2-git-send-email-rishabhb@codeaurora.org>
Message-ID: <1690dbd5ba65e864ed70144393b32adb@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey Rishabh,
Thanks for the patch.

On 2020-06-30 01:32, Rishabh Bhatnagar wrote:
> Move all coredump functionality to an individual file. This is
> being done so that the current functionality can be extended
> in future patchsets.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
Tested-by: Sibi Sankar <sibis@codeaurora.org>

> ---
>  drivers/remoteproc/Makefile              |   1 +
>  drivers/remoteproc/remoteproc_core.c     | 191 
> -----------------------------
>  drivers/remoteproc/remoteproc_coredump.c | 204 
> +++++++++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h |   4 +
>  4 files changed, 209 insertions(+), 191 deletions(-)
>  create mode 100644 drivers/remoteproc/remoteproc_coredump.c
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
