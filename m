Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9684C24A2
	for <lists+linux-remoteproc@lfdr.de>; Thu, 24 Feb 2022 08:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiBXHr6 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 24 Feb 2022 02:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbiBXHr6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Feb 2022 02:47:58 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1400C131F7E
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Feb 2022 23:47:28 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 13CCB3FCA9
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Feb 2022 07:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645688845;
        bh=Zs4sP9i99NlTTPrJcg2NREY6h9bovqrYIvzZODv1Ymc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=audFa8N1MYXMYY77uj+OzOO0rIKF3j4lw5r6BiUOU6597PLp3e/oRXPznAX/H2uah
         f6Mfgz/D/890EptqsbpWliJ2QvXelz/ihWaltTbmwKmbkctH5mlZVJwNrbPaKeW1Uu
         hBqgBqmcjTHc01kdHY0gDlAIdgdsgOYf/9xEog76qzSTUY1Qa3IFQ7ll4l4pho6fOF
         j7R5BKdJm85nzGUzxZN7+SUfz15RhfThavnMmz/ZUdgd5G9ouaAZA9jqqmS7f9fzzX
         xrDCy6QHSpUh+BNpZFpGQVt50HRBcsHbS9v2lsChBTfTq7FGKZ7tiiOozBe1tm2VYr
         WISHSY2f5CPBA==
Received: by mail-ej1-f71.google.com with SMTP id go11-20020a1709070d8b00b006cf0d933739so823655ejc.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Feb 2022 23:47:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Zs4sP9i99NlTTPrJcg2NREY6h9bovqrYIvzZODv1Ymc=;
        b=OJruP3vIs0NNBlbphvaKFcQzUDx835dNlUHKeZ72t25tIvbQzlIpMNdggKrZPKfZC+
         qVTfUYqgHMEEXXfSiMROsBwxb2JwzjmfHXpGgkjjuJSNyR732PmV8hnbFE65AjdvD+RJ
         rNaWV56Y0fLPLdHrpI7L6cC5dGFbVrYdaL9xg/FntOON2mZtuzv+5OP6VzTW3xg8ulfL
         dJksk4yXIF/JlErnt1fYl9VU78BWRi8wWA+k2luHCcwt8R335tWwQ78dunV1+dPh40ga
         Y19GOzRBx+DEycMXu2ZjXEgDEozAOLjBkmMVA4JCevFl5Moa+R5rVSte8E9TzwOo32BR
         6law==
X-Gm-Message-State: AOAM531Hx2U+0DxuMhlACO5HB2t/GFVgdEvr09h+iQyPuwyWzbE5Zo+q
        BRUCMBUOwFF9+oas/JQIHtDMClgQAjOUBk5L/YfZVUY4UVTd76VIu3cHED3Qb1kBoOHez+N5qC6
        KcB+gaMJTlc9SGtOewTvmYwTH4KZknTydccjdo2W7skJacn8=
X-Received: by 2002:a17:906:aed4:b0:6ba:6d27:ac7 with SMTP id me20-20020a170906aed400b006ba6d270ac7mr1258068ejb.33.1645688844793;
        Wed, 23 Feb 2022 23:47:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUYNmN/4hZMQwnBoVYe/1HJVh2ik7cDwSx+7g3/XCwKJDGgQtwwmTKf8PpD7KGJnApbTtGHA==
X-Received: by 2002:a17:906:aed4:b0:6ba:6d27:ac7 with SMTP id me20-20020a170906aed400b006ba6d270ac7mr1258017ejb.33.1645688844569;
        Wed, 23 Feb 2022 23:47:24 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id v30sm942368ejv.76.2022.02.23.23.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 23:47:24 -0800 (PST)
Message-ID: <bc4f3314-46f2-72a8-f25c-c9774d987ca1@canonical.com>
Date:   Thu, 24 Feb 2022 08:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/11] driver: platform: add and use helper for safer
 setting of driver_override
Content-Language: en-US
To:     Bjorn Helgaas <helgaas@kernel.org>
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
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20220223215342.GA155282@bhelgaas>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220223215342.GA155282@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 23/02/2022 22:53, Bjorn Helgaas wrote:
> On Wed, Feb 23, 2022 at 08:13:00PM +0100, Krzysztof Kozlowski wrote:
>> Several core drivers and buses expect that driver_override is a
>> dynamically allocated memory thus later they can kfree() it.
>> ...
> 
>> + * set_driver_override() - Helper to set or clear driver override.
> 
> Doesn't match actual function name.

Good point. I wonder why build W=1 did not complain... I need to check.

> 
>> + * @dev: Device to change
>> + * @override: Address of string to change (e.g. &device->driver_override);
>> + *            The contents will be freed and hold newly allocated override.
>> + * @s: NULL terminated string, new driver name to force a match, pass empty
>> + *     string to clear it
>> + *
>> + * Helper to setr or clear driver override in a device, intended for the cases
>> + * when the driver_override field is allocated by driver/bus code.
> 
> s/setr/set/

Right. Thanks for checking.

> 
>> + * Returns: 0 on success or a negative error code on failure.
>> + */
>> +int driver_set_override(struct device *dev, char **override, const char *s)
>> +{


Best regards,
Krzysztof
