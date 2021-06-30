Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E683B8950
	for <lists+linux-remoteproc@lfdr.de>; Wed, 30 Jun 2021 21:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbhF3TyG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 30 Jun 2021 15:54:06 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:35026 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233893AbhF3TyF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Jun 2021 15:54:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625082696; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=V7lsXlTjtrdwWghKYPUDTQXdb46MQsLiqtlhM/GsIf0=;
 b=H1Eky07C+qPe4+ymUTzw+ttzYVg48+2HXl67Ex1vqdWo9lR/dkd64cIGrIWKW4QgMDT9Yf6s
 YYFdhbeSx4oPJFB5P2fzGEI77WPWdxUR48r5DnMXBu5Xh42q8CZLO7/QQCBqkK4EAbJASrX0
 OCrjYVHR0XKS9r19MycdAr6qGLQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60dccb393a8b6d0a45e7afe7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Jun 2021 19:51:21
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 668CFC433F1; Wed, 30 Jun 2021 19:51:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BE764C433F1;
        Wed, 30 Jun 2021 19:51:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 01 Jul 2021 01:21:19 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        swboyd@chromium.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v3 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP
 bindings
In-Reply-To: <YNZIeZVpmJW6VVnG@google.com>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
 <1624560727-6870-3-git-send-email-sibis@codeaurora.org>
 <YNZIeZVpmJW6VVnG@google.com>
Message-ID: <6c3dc7c6175b6e7871039ca7baac2bd8@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2021-06-26 02:49, Matthias Kaehlcke wrote:
> On Fri, Jun 25, 2021 at 12:21:56AM +0530, Sibi Sankar wrote:
> 
>> Subject: dt-bindings: remoteproc: qcom: pas: Add QMP bindings
> 
> nit: does this really add a QMP binding (as in
> Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt) or
> rather a QMP property/phandle to the ADSP binding?
> 
>> Add Qualcomm Mailbox Protocol (QMP) binding to replace the power 
>> domains
> 
> same nit
> 

Will need to re-spin this anyway since Bjorn
aoss-qmp to yaml, will fixup the commit message.

>> exposed by the AOSS QMP node.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
