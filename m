Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC4651BBA4
	for <lists+linux-remoteproc@lfdr.de>; Thu,  5 May 2022 11:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351912AbiEEJRE (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 5 May 2022 05:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237484AbiEEJRD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 May 2022 05:17:03 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D234BFCB
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 May 2022 02:13:24 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id a21so4476410edb.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 May 2022 02:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=C13CFKJEOWyH4FQIHZ/zbMnXVynUc/Y9MwQkzIzQHbE=;
        b=F6SFjkjjWudZLAozoSYNPJQraIiViaBJ2Unq9ZF3WmHPCPxSPqMYXfwo0cWrp7R3Zs
         3zplapT1nChS1cRnMbQFli1zcNAGqFo1MPfGZark0mRVOumKUdefulsAmgfA0QxoP2Qr
         uWM+ij6HoeUN1G4VKS/bR4UCiXvXLxsG0vvS2pTdph1ldSuw2KoWBGgBPnbkUJW0Co+R
         +bktWgbr5PDS4JNOEuhDuBaeqHNJeBkJscx7s0uAFHq+Ke3XEfA0jFFwiXXr1Qh91JJv
         tlEtjRTPjzzm3ZNSM60oHrmgcE38hIDGHZwFnLnvLXi87ZRuHOEu8MZNadxmbkazggCL
         XuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C13CFKJEOWyH4FQIHZ/zbMnXVynUc/Y9MwQkzIzQHbE=;
        b=PcCfz7G1wcxgML3mfS/LLN3f+Dx2/tdDVcOedvjyrvAUCkd4zI+9Q69eZS6K4/WG0y
         Z/zwMmvWs14ZD9ObFTeNv1zTx71S0aCoURQqBN0SzK/dbRM+9MqtJMD9iJvXgUI0rkAz
         1m96+Btvde3/0MQVgJ2vXAfqY5ObDBqXNs3fBXo7thIK+4B7xFV9B82O+TgTiyA3Dcpg
         7MCbcsZNcHCuYG9KUn8jYiCDgG2qqGZlBDsB3Qns9seE2fDKmrZl93oZlALpIP21TJuK
         LE0pWe547odl+jK1WlDnKwW3iIe3QUvt6/4nqLTaenBL/B95bsKKQb4+L9DV6w/qI8Vt
         Ub6Q==
X-Gm-Message-State: AOAM532wN1MDG71qASzU/ae+aTPZC54gNibv/Nnu3bvz40yLJmeYp86z
        LXKoPR034al2JxRUP6BVTRgm6Q==
X-Google-Smtp-Source: ABdhPJyauXqqC7x8uraKE/6KGzasb6Rf6omeH6bh0NkPyDvQ1ATzyeeI5h3E8OUKjmWmg42poxBUVQ==
X-Received: by 2002:a05:6402:849:b0:427:edfe:1b7e with SMTP id b9-20020a056402084900b00427edfe1b7emr12779009edz.355.1651742002696;
        Thu, 05 May 2022 02:13:22 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id my50-20020a1709065a7200b006f3ef214e79sm502596ejc.223.2022.05.05.02.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 02:13:22 -0700 (PDT)
Message-ID: <c790db17-79b9-a73f-ed0f-728a8a075ba1@linaro.org>
Date:   Thu, 5 May 2022 11:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 optional for mtk,scp
Content-Language: en-US
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20220503211114.2656099-1-nfraprado@collabora.com>
 <20220503211114.2656099-2-nfraprado@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503211114.2656099-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 03/05/2022 23:11, Nícolas F. R. A. Prado wrote:
> The SCP has three memory regions: sram, cfg and l1tcm. While the first
> two are required, l1tcm is optional. Fix the dt-binding so that it can
> be omitted and update the description. This gets rid of dtbs_check
> warnings for devicetrees where the l1tcm reg is missing like mt8183.

Please add "if:then:" for this case (need to put all ifs in allOf). I
understand that l1tcm is optional *only* on mt8183.

Best regards,
Krzysztof
