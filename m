Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 605FAB7F5D
	for <lists+linux-remoteproc@lfdr.de>; Thu, 19 Sep 2019 18:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732785AbfISQuK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 19 Sep 2019 12:50:10 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54164 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbfISQuK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Sep 2019 12:50:10 -0400
Received: by mail-wm1-f67.google.com with SMTP id i16so5422583wmd.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Sep 2019 09:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qEDrSkRuuo6lL+9DY4DVGx51w66YHOspKUBct+J7PsM=;
        b=q9V8LOeiE+364i78EeVgeUXc7zuwpTt9nK4dpxcKgjCZKsP3mEzEClf2oOVu8qEnD6
         tPFAmHMOG9eBWSWp8YzG0RZ3ekqH6iBxnlmCPbirm7oFujKUdlDtTDI3aBEBVLA5XFua
         gvMGkkreSEoPSoirpYZpNA/0L727emywPGT3ugA35ZYvBsHoUHjGfyTZfTCir7rPFcST
         L9MGeDnc+DC/oSqemRoZfvhCy00ebMmIiJWVmZOMMHFu3LBZy17QiRwim3RSq0q2+uCR
         usoqBvFwTmxj8a7DY1gIOKsYat/lJNAdwR9/8DVXaORL8Sh7hhT1c8bcQ6l/S906xAI9
         P88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qEDrSkRuuo6lL+9DY4DVGx51w66YHOspKUBct+J7PsM=;
        b=YP0IcNQ0l5Kniuq0BJNxTDTigoN5L4Fh3OS5Tsi2It2oKLRaQi0oIk7bBDW8LvJHt/
         DL3ONOqezTJy1IIAFl3zpEmIpMqXnT6QAe9JNj9iIF3JmpqQ5fh6W9Cwr/Z63N4sNWto
         x77Wbir8mRUZz9HazeHAVZ+h97RWix98bihPkUINp+sKjpTShHQYWhBtY812jHF3dXAP
         hHgMUp0exlr764tGpehqvZ9OVRxPNk2CtylxUYm3ejeQNo/C3ve93gIjCFN8u+IRWVsw
         C/hrBFw2ZkMCw892AtcaHxE5wpApHISa3Dp7F3Mfy6Nz5J6cenD2VTrbIycdrEfKN5ts
         fBtg==
X-Gm-Message-State: APjAAAXndVvw2sg2iupdcRkvHGcDZoE/rdosPaRfMPjNRij/EMqo1x9W
        BNshgsUKrKUpt5lXWe/yo29Qrg==
X-Google-Smtp-Source: APXvYqzBroZEcwk9i2c/xO/jp6uxLLX76ENOImmzPZLTWzLhoVXMVZ0JbZLe5mS0tiXjoN63s5XMPQ==
X-Received: by 2002:a1c:2d44:: with SMTP id t65mr3654035wmt.12.1568911809121;
        Thu, 19 Sep 2019 09:50:09 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id u10sm17381210wrg.55.2019.09.19.09.50.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 09:50:08 -0700 (PDT)
Subject: Re: [PATCH 0/6] rpmsg: glink stability fixes
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190918171916.4039-1-bjorn.andersson@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <74b3d165-b1ea-e4e3-df50-98bda8691d5c@linaro.org>
Date:   Thu, 19 Sep 2019 17:50:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918171916.4039-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 18/09/2019 18:19, Bjorn Andersson wrote:
> Fixes for issues found in GLINK during reboot testing of a remoteproc.
> 
> Arun Kumar Neelakantam (2):
>    rpmsg: glink: Fix reuse intents memory leak issue
>    rpmsg: glink: Fix use after free in open_ack TIMEOUT case
> 
> Bjorn Andersson (2):
>    rpmsg: glink: Don't send pending rx_done during remove
>    rpmsg: glink: Free pending deferred work on remove
> 
> Chris Lew (2):
>    rpmsg: glink: Put an extra reference during cleanup
>    rpmsg: glink: Fix rpmsg_register_device err handling
> 
>   drivers/rpmsg/qcom_glink_native.c | 50 ++++++++++++++++++++++++++-----
>   1 file changed, 42 insertions(+), 8 deletions(-)
> 

Thanks for the fixes.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
