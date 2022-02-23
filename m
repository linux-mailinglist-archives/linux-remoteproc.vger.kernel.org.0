Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCAE84C1C16
	for <lists+linux-remoteproc@lfdr.de>; Wed, 23 Feb 2022 20:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244333AbiBWTTi (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 23 Feb 2022 14:19:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237781AbiBWTTh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Feb 2022 14:19:37 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDE745AEF
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Feb 2022 11:19:09 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 588693F1D9
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Feb 2022 19:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645643948;
        bh=OsmDWPse4xUb7lllvZErJnLq536hKmJqOuDcEnXswgI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Pyi3ZOsftRe4LCarU+sJ6V9zOGZ1f2csY6Ye3gN++YLm0D91rrcv3GRDbrIdPrAnU
         KossIc9JSbE3oNYq6ku9O22UXEO2o2js/uhDaaSAFBroR6N+CrTI/y/flxACvVQSJA
         p5ssWrFAJRdX+kf44kuNx52Pw0M3CpZukl/3jNw0NeLCSrwEMP9OhCyukUHmiR4y95
         Fan33RM5XlgKofNgCWBgba5PBrP14Gp8EyXk4U6qmHYOHNBhgBqMyioyXfH6br3b3s
         abHNwAngTxkyadwJGAbvWHg+wWYKiKnRjwgBY4xrSKK2WM2hiAL+jCgBxPBMMjwT4X
         77C5OzygbQjmg==
Received: by mail-ej1-f70.google.com with SMTP id go11-20020a1709070d8b00b006cf0d933739so7528632ejc.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Feb 2022 11:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OsmDWPse4xUb7lllvZErJnLq536hKmJqOuDcEnXswgI=;
        b=Y6Hhq+eNzwaQ5TbVeps1wQAL2i3OLoDQV/xcnh2pilKPsZgB6FOWiwsOWNJGVZACdb
         xq0sE/Fujv11V6XRTUFnaY6CvHmjg1eSBY5pBP7TM3sa7qjsywuQyNBsFCasZ6ALg+Dj
         UxdTjAjkO7HwH++9TJuYkMDoq44yYNnqPFP4NP1LnsXMZmla0AayhaN+LpIkWR6r28nG
         ErHF3pboCnPItfP6haNV3UXJOj3LW9Mi5KhjxAROuJ3IgX59H2mzE24Hl5EIKpW6aF4C
         cYmHpIhB0PWgwfuuvQZq4nTd2Y1ogpXN/5K2y8GL8821g/Gp8GvnKxB/pB9eH1QAMkSv
         J8Jg==
X-Gm-Message-State: AOAM532VpAsq+kGk9X2uM/A9uMe9AypEAGJrNN+o/gOCueZQFbPntgQL
        kG5/4ElRtpGqaERfBL5XQVl9JMIOWBYKZWtx1EzOKJlkrBX0HDIyoZ9npKyKQnSgn0wzOcqB3VJ
        GClKkNAWc6LI8JR+0q6Q/NORHmGDrAA4R1x7MJm7CwjXW9mc=
X-Received: by 2002:a17:906:6b8e:b0:6b9:1f27:73e with SMTP id l14-20020a1709066b8e00b006b91f27073emr863413ejr.361.1645643947953;
        Wed, 23 Feb 2022 11:19:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJ9QUyPanWfiXE6vKIo8o+c2pwl8ckmaYif3CteDvcltA9YiJZAZD09dYlCxpl8UKoIvZBag==
X-Received: by 2002:a17:906:6b8e:b0:6b9:1f27:73e with SMTP id l14-20020a1709066b8e00b006b91f27073emr863390ejr.361.1645643947743;
        Wed, 23 Feb 2022 11:19:07 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id x14sm302707edd.63.2022.02.23.11.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 11:19:07 -0800 (PST)
Message-ID: <31c4f987-6480-278f-1d49-02bd611b521c@canonical.com>
Date:   Wed, 23 Feb 2022 20:19:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/11] clk: imx: scu: fix kfree() of static memory on
 setting driver_override
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>, stable@vger.kernel.org
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
 <20220223191441.348109-3-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220223191441.348109-3-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 23/02/2022 20:14, Krzysztof Kozlowski wrote:
> The driver_override field from platform driver should not be initialized
> from static memory (string literal) because the core later kfree() it,
> for example when driver_override is set via sysfs.
> 
> Use dedicated helper to set driver_override properly.
> 
> Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/clk/imx/clk-scu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index 083da31dc3ea..15e1d670e51f 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -683,7 +683,12 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
>  		return ERR_PTR(ret);
>  	}
>  
> -	pdev->driver_override = "imx-scu-clk";
> +	ret = driver_set_override(&pdev->dev, &pdev->driver_override,
> +				  "imx-scu-clk");
> +	if (ret) {
> +		platform_device_put(pdev);
> +		return ret;

This is wrong - should be ERR_PTR.


Best regards,
Krzysztof
