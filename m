Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 815CC184679
	for <lists+linux-remoteproc@lfdr.de>; Fri, 13 Mar 2020 13:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgCMME4 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 13 Mar 2020 08:04:56 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44685 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgCMME4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 Mar 2020 08:04:56 -0400
Received: by mail-ed1-f68.google.com with SMTP id g19so11535207eds.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2020 05:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KVQaV5WPaAITEfXGJD3iw4zrtyye7kAolYp6oZ1quUI=;
        b=GVZv6ChaXLEWYvbrWTdhS4i8fMw2qeJSXb/2JBjNdfMY6mhOggh6/Z5mOaWCYPz6Ad
         PetuwUXpdI272XaInycenRqesHqQBmYhwOBAMPaM4DCpfbCev1WQekRbj0o7QM4YsMTi
         FkvBwDPMqy4tbFaLyfxVfYKBPgeGMPLpoi1kp2ylMBm1/Ithj6eoLKXkBEzlhpA/ihLd
         qL22Qiw9DAFKOJT6+N8KPo5aUP110lqB7mD++bhFrTZXbdce6Qd/U/JEnBbgdbSZBnq/
         AaqJO9+Hx6eGmoHph7LwUFG+z4KSEcnIHB1QgOQ3JYmudJ1VcD4R91SoUMJraYGdukpk
         vEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KVQaV5WPaAITEfXGJD3iw4zrtyye7kAolYp6oZ1quUI=;
        b=ltK6o0odn0EZBpZ+D91IeJOppAO1srK4r0Kx5VD4nB9EyQwHafrNUgPtvQ/i+zPCfW
         QBg3ml15txweoholPEhAIeRE3AbLEtn1Yckf8H53CAPr3Mu36bzXcWzOXMhlmezt4TV8
         OPD0lviODn7i4BIUzJWvLHTIyunNfK6M+EQh47xqy5Km1pP8Z/ig+W5+eoX0cBTr4aOv
         vq6K0bfDTe71k23EfvR5pIZAki4mX81kSyvOUPcgVEjTrbMp5Bj/axFAht6ZjAmIdk92
         sglgi4jD9DJJdrjbzlSnq/XjkXpB6jU7C5BT0lyZl+wdxlwCZuinTRjRxGSgCrcmJbA9
         FyPw==
X-Gm-Message-State: ANhLgQ02PYLN7W8+K0/n2OJrf+qOUTP8X4mUBZmUCphIL07Fp3xxj1FH
        xvAZkIyrt5TB0f342lCXJvJCKA==
X-Google-Smtp-Source: ADFU+vskqub7CpCaC/ugUWZs2oR/RvePIrTwC+6a82eCHZMWi25KAtvuE8JcxWJt62Qtis9Q1Vw0NQ==
X-Received: by 2002:a17:906:76c6:: with SMTP id q6mr11068012ejn.176.1584101092902;
        Fri, 13 Mar 2020 05:04:52 -0700 (PDT)
Received: from [192.168.1.9] ([84.238.208.211])
        by smtp.googlemail.com with ESMTPSA id v25sm4584220edx.89.2020.03.13.05.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 05:04:52 -0700 (PDT)
Subject: Re: [PATCH -next 011/491] ARM/QUALCOMM SUPPORT: Use fallthrough;
To:     Joe Perches <joe@perches.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Amit Kucheria <amit.kucheria@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-pm@vger.kernel.org
References: <cover.1583896344.git.joe@perches.com>
 <2e6818291503f032e7662f1fa45fb64c7751a7ae.1583896348.git.joe@perches.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <2ac47436-e13c-bc87-d661-e4a423c7ef5b@linaro.org>
Date:   Fri, 13 Mar 2020 14:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2e6818291503f032e7662f1fa45fb64c7751a7ae.1583896348.git.joe@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

On 3/11/20 6:51 AM, Joe Perches wrote:
> Convert the various uses of fallthrough comments to fallthrough;
> 
> Done via script
> Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/media/platform/qcom/venus/vdec.c |  2 +-

For the Venus bits:

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

>  drivers/phy/qualcomm/phy-qcom-usb-hs.c   |  2 +-
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c |  4 ++--
>  drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c |  2 +-
>  drivers/rpmsg/qcom_glink_native.c        |  4 ++--
>  drivers/soc/qcom/socinfo.c               | 16 ++++++++--------
>  drivers/thermal/qcom/tsens-v0_1.c        |  8 ++++----
>  drivers/thermal/qcom/tsens-v1.c          |  4 ++--
>  8 files changed, 21 insertions(+), 21 deletions(-)
> 

-- 
regards,
Stan
