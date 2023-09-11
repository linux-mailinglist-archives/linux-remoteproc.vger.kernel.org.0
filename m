Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5B679B958
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Sep 2023 02:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348479AbjIKVaA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 11 Sep 2023 17:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236644AbjIKLI7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Sep 2023 07:08:59 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A843CDC
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Sep 2023 04:08:54 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so69924611fa.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Sep 2023 04:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694430532; x=1695035332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2r1pG42saIT1hQx+TELlhxvqJ0mmluvD/XCTWLDnio4=;
        b=wiqYEoqFcRjvUJ+brPwmPIQsX601vW9w8Tsnu1Wq2ODfoOBinAdHwM3udjpT3NfpEK
         zLbJBfRuKP+MLBUMAZiCe99wJxw+X2fQ+VR5yT1EBUSGY8AabfTWSoysZYMpfXQyc9Du
         JrVYOLgEK9BfgDRt7NmU0QIVpWCeIAPrR7CgOhNasQf94iOBsDOvQNXcXZeoo8hdosBD
         GeXkBMRu2nGTISH60Aytf/E/4KtaK8E3go5IWxtzr4bUnt5hao6xA8gkHo0WPp3c5F1H
         Lm+XJ1OnEGwCw4FIdj0HoZtu9/RtexxM4UGAmSMmV730x5eC3PaZXJVp5MklhADw4O3o
         r/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430532; x=1695035332;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2r1pG42saIT1hQx+TELlhxvqJ0mmluvD/XCTWLDnio4=;
        b=rlwp/cHblNjYOb6cPMPS3KX1v4GFppLZIwZXWF+IkjCKrKb6dj3Ws8lHlEwhFfbfRo
         /JuFLkd4BSBit+gfxQbfrTzZPuwbl/d1s3HqeNSHFpP2ki7ReA5UqqQ8T7QsgVBGVcb2
         MLec3aRyDETAnd5dXihCLPkHKKhZUwNNSX+3W7DquSZpYio3+an38OXb29wb6RXfyR2c
         dlhSDONuXN4NfQ4XJ1knovn4HDFl3chONmV6zXFzea4eVVZ7/rhJW+RRpaTQvfebNMap
         bWUi2LLfqbUB8gwVfuaqNMIP5vp4zCfF2WVHwG0z8BplX9GIdfBecw3tUd3uoei74nA5
         eTmg==
X-Gm-Message-State: AOJu0YzPzPccFxsjvlqLbg8VhS9n7UTkDNws3IIOZzfxPJvfZRl+eM4Z
        VLwTHaBgyzSMESzj4PApnWQoEg==
X-Google-Smtp-Source: AGHT+IFhJr6aCH0nOA8CkPBUhMy540nMaAY+Mvm7js3Wpv0+d0W8u8lZbEJt3lbAgLcQPiDqKMNL3g==
X-Received: by 2002:a05:651c:1994:b0:2bf:789e:b5dd with SMTP id bx20-20020a05651c199400b002bf789eb5ddmr5800990ljb.53.1694430532675;
        Mon, 11 Sep 2023 04:08:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id si28-20020a170906cedc00b009786c8249d6sm5244877ejb.175.2023.09.11.04.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:08:52 -0700 (PDT)
Message-ID: <75466db4-3d19-33f6-b2de-db714186a96b@linaro.org>
Date:   Mon, 11 Sep 2023 13:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 07/17] soc: qcom: minidump: Add pending region
 registration
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, keescook@chromium.org, tony.luck@intel.com,
        gpiccoli@igalia.com, mathieu.poirier@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, vigneshr@ti.com, nm@ti.com,
        matthias.bgg@gmail.com, kgene@kernel.org, alim.akhtar@samsung.com,
        bmasney@redhat.com, quic_tsoni@quicinc.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
 <1694290578-17733-8-git-send-email-quic_mojha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1694290578-17733-8-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 09/09/2023 22:16, Mukesh Ojha wrote:
>  static int qcom_apss_minidump_probe(struct platform_device *pdev)
>  {
>  	struct minidump_global_toc *mdgtoc;
> @@ -571,7 +688,10 @@ static int qcom_apss_minidump_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	mutex_lock(&md_plist.plock);
>  	platform_set_drvdata(pdev, md);

Why this is locked?

> +	qcom_apss_register_pending_regions(md);

Why this one is locked? It seems ordering of your operations is not
correct if you need to lock the providers probe().

> +	mutex_unlock(&md_plist.plock);


Best regards,
Krzysztof

