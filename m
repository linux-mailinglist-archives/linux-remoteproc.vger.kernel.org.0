Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73DCD4DAF6F
	for <lists+linux-remoteproc@lfdr.de>; Wed, 16 Mar 2022 13:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355598AbiCPMOh (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 16 Mar 2022 08:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355594AbiCPMOg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Mar 2022 08:14:36 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9F035271
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Mar 2022 05:13:22 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 861143F1AF
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Mar 2022 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647432799;
        bh=WEml57iQP8ABbI+mDA7s3AB7OtRvXlB4GSsR8dRD3Dc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=JOyDGWCjP/ROq6xW/mYSmdlB5ck0FLMG5KFLwp7XkZ8ejAhSJsLB3BN+HulfhI3AI
         SptozDrS65aISu6YiBAbE5I433Y94tsSTrzb97n9rC1zEWJMTD26akO3aOb8HfXIh+
         wRjfZEgxN3/njFnH/FsHoaARrbEmCEsx9VcBPA5mc2eO8rxUi38UDkU/7Q2O1QzQgw
         Acdb5ZYfbbObENcMRr7tXGXtuCRVq+cQchnSwmQI8vC4DqkkAhPs7B0ykl0sK3Yrro
         RE8JtaBaDz5iWd2tNQoan1C97d159mWFrteSDjVCeWeoj/CJq1/4ivEhNWbdmMNR+K
         04jPQn4KL8YFA==
Received: by mail-ed1-f69.google.com with SMTP id n4-20020a5099c4000000b00418ed58d92fso522500edb.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Mar 2022 05:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WEml57iQP8ABbI+mDA7s3AB7OtRvXlB4GSsR8dRD3Dc=;
        b=4Vub0WkQ9ulQoa2RO18afVdWNPvQNbQQzQIcFSGhh0ATfGcGR84r2dvWoqKIafrDwk
         RiLLjHLeOlI9BZCz1fbJ4c7XC8nqrb8QDPf2IycTdqA1+b4bbNZoe3F9by/Y2iGoOFzn
         xt37anwYgORPjKrGOfM0ZGmx86oWQeHMoI+8riYyPZyanKLmlo5u/NlogguPt0c2PVOz
         3l8N1WV1QiNZFLDjZ4kREkDBPBXuu9/h9bUMZw0WQPxHMKBBjL8jq4NH3rCufa3I6tIR
         K364biuQGmw9vCCl/wsbLh1RfERjeyRdrNmnMEmp2lCCFrqUL5E5TtZvK83h7iGJ3gQ8
         atIg==
X-Gm-Message-State: AOAM530Awv74d2t5ZMKGziSmX4Gm3vzdIv4dFNC1vUkWsi/YiAv/bjv5
        D4IizM0lQgVFWLGRBMQKSH1J5gE6FvPzB23/CS+hagKIJw504rsykEJIVtmNGjxcHHXohrlIJxK
        CIwYwr32rvkw+ydAHxnVPY/5/It5CzPpxsMhoto/Q7zV+mgk=
X-Received: by 2002:adf:8063:0:b0:1ef:78e3:330 with SMTP id 90-20020adf8063000000b001ef78e30330mr23936009wrk.424.1647432789100;
        Wed, 16 Mar 2022 05:13:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7tLnLEOOtwMMJsokfBIh0t57hslQQvVmwtzfcwFM6mg7nh7jx6KQIhSbucvh9csOs9eabrQ==
X-Received: by 2002:adf:8063:0:b0:1ef:78e3:330 with SMTP id 90-20020adf8063000000b001ef78e30330mr23935984wrk.424.1647432788803;
        Wed, 16 Mar 2022 05:13:08 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id o11-20020adf9d4b000000b001f0077ea337sm1541013wre.22.2022.03.16.05.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 05:13:08 -0700 (PDT)
Message-ID: <a323b141-94f1-800a-6a56-6204fa01e968@canonical.com>
Date:   Wed, 16 Mar 2022 13:13:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 01/11] driver: platform: Add helper for safer setting
 of driver_override
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        Jason Wang <jasowang@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
 <20220312132856.65163-2-krzysztof.kozlowski@canonical.com>
 <CAHp75Vd6yu0OA6wYvPVs8J1wRDPyb6tCYXOjp9poweJd0sfPcw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAHp75Vd6yu0OA6wYvPVs8J1wRDPyb6tCYXOjp9poweJd0sfPcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 15/03/2022 18:59, Andy Shevchenko wrote:
> On Sat, Mar 12, 2022 at 5:16 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Several core drivers and buses expect that driver_override is a
>> dynamically allocated memory thus later they can kfree() it.
>>
>> However such assumption is not documented, there were in the past and
>> there are already users setting it to a string literal. This leads to
>> kfree() of static memory during device release (e.g. in error paths or
>> during unbind):
>>
>>     kernel BUG at ../mm/slub.c:3960!
>>     Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
>>     ...
>>     (kfree) from [<c058da50>] (platform_device_release+0x88/0xb4)
>>     (platform_device_release) from [<c0585be0>] (device_release+0x2c/0x90)
>>     (device_release) from [<c0a69050>] (kobject_put+0xec/0x20c)
>>     (kobject_put) from [<c0f2f120>] (exynos5_clk_probe+0x154/0x18c)
>>     (exynos5_clk_probe) from [<c058de70>] (platform_drv_probe+0x6c/0xa4)
>>     (platform_drv_probe) from [<c058b7ac>] (really_probe+0x280/0x414)
>>     (really_probe) from [<c058baf4>] (driver_probe_device+0x78/0x1c4)
>>     (driver_probe_device) from [<c0589854>] (bus_for_each_drv+0x74/0xb8)
>>     (bus_for_each_drv) from [<c058b48c>] (__device_attach+0xd4/0x16c)
>>     (__device_attach) from [<c058a638>] (bus_probe_device+0x88/0x90)
>>     (bus_probe_device) from [<c05871fc>] (device_add+0x3dc/0x62c)
>>     (device_add) from [<c075ff10>] (of_platform_device_create_pdata+0x94/0xbc)
>>     (of_platform_device_create_pdata) from [<c07600ec>] (of_platform_bus_create+0x1a8/0x4fc)
>>     (of_platform_bus_create) from [<c0760150>] (of_platform_bus_create+0x20c/0x4fc)
>>     (of_platform_bus_create) from [<c07605f0>] (of_platform_populate+0x84/0x118)
>>     (of_platform_populate) from [<c0f3c964>] (of_platform_default_populate_init+0xa0/0xb8)
>>     (of_platform_default_populate_init) from [<c01031f8>] (do_one_initcall+0x8c/0x404)
> 
>>     (do_one_initcall) from [<c0f012c0>] (kernel_init_freeable+0x3d0/0x4d8)
>>     (kernel_init_freeable) from [<c0a7def0>] (kernel_init+0x8/0x114)
>>     (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)
> 
> I believe you may remove these three.

Sure (for this and later comments).

> 
>> Provide a helper which clearly documents the usage of driver_override.
>> This will allow later to reuse the helper and reduce amount of
> 
> the amount
> 
>> duplicated code.
> 
>> Convert the platform driver to use new helper and make the
> 
> a new
> 
>> driver_override field const char (it is not modified by the core).
> 
> ...
> 
>> +/**
>> + * driver_set_override() - Helper to set or clear driver override.
>> + * @dev: Device to change
>> + * @override: Address of string to change (e.g. &device->driver_override);
>> + *            The contents will be freed and hold newly allocated override.
>> + * @s: NUL terminated string, new driver name to force a match, pass empty
> 
> NUL-terminated? (44 vs 115 occurrences)
> 
>> + *     string to clear it
>> + * @len: length of @s
>> + *
>> + * Helper to set or clear driver override in a device, intended for the cases
>> + * when the driver_override field is allocated by driver/bus code.
>> + *
>> + * Returns: 0 on success or a negative error code on failure.
>> + */
>> +int driver_set_override(struct device *dev, const char **override,
>> +                       const char *s, size_t len)
>> +{
>> +       const char *new, *old;
>> +       char *cp;
>> +
>> +       if (!dev || !override || !s)
>> +               return -EINVAL;
>> +
>> +       /*
>> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
>> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
>> +        * Thus we can store one character less to avoid truncation during sysfs
>> +        * show.
>> +        */
>> +       if (len >= (PAGE_SIZE - 1))
>> +               return -EINVAL;
>> +
>> +       new = kstrndup(s, len, GFP_KERNEL);
>> +       if (!new)
>> +               return -ENOMEM;
>> +
>> +       cp = strchr(new, '\n');
>> +       if (cp)
>> +               *cp = '\0';
> 
> AFAIU you may reduce memory footprint by
> 
> cp = strnchr(new, len, '\n');
> if (cp)
>   len = s - cp;
> 
> new = kstrndup(...);
>

Indeed, thanks.

Best regards,
Krzysztof
