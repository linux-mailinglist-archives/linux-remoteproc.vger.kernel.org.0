Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABD8C6DAE61
	for <lists+linux-remoteproc@lfdr.de>; Fri,  7 Apr 2023 15:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbjDGNyg (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 7 Apr 2023 09:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbjDGNyW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Apr 2023 09:54:22 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B48ECC16
        for <linux-remoteproc@vger.kernel.org>; Fri,  7 Apr 2023 06:52:21 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id l15so8554364ejq.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Apr 2023 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680875485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A/NA2TmYwSaD4RFz90MGIkIrg7vRhmuwHGBdbiR2Km8=;
        b=W/Y6pxU0uv1ioKEIlw+qLaGLHKVF46JSMJrX6/6FmT5AqtBp8orsjie+YEBMyyiY0e
         hM0h/Wlwpg2UFjdjJd9pFWsW56JsZ6EBdX3JWGndga+IDbDHpeHQa+MZkGk6cCfBjZxR
         WmoWl01WB2reDwoLwUIRGNuWZtoj0mPHEGDCDBbf1qrtegOAEXadvNOwSDOx0ReUbNzx
         9A+frwkIQNzZG4rBMR4vWeSXoUtfiS9FK0Y6+edWOnoB7Ddq1CjCHoUDpvMK0Uhh/545
         N+F2qV+fWyuX08eTL6DXH15GfyzHGhZzNXETTirYFYOMRNYZTCDFLUH2oWwR9N6zO7vv
         mSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/NA2TmYwSaD4RFz90MGIkIrg7vRhmuwHGBdbiR2Km8=;
        b=38ofe3tZwGMzf0apTnn5zqM79Szg61VsUmO3bVxEyigST9fFZ3GC3qYVquq3WCQb2b
         6H1XSh3TYWYH3TW8vLoP4JYCTNc0Qnio9s2MpLLFhdb8DUmWyzKVgJilC+gZAN99YxqM
         CDrKeHKo23eW/VvfhEyF4i9IjvKYTyfenOzWu8O49slW+Lyf+P0m9SEIJJsd0cd3yA6t
         A1iaVUGGT60VxCx7/fgJqhnSLBdrjsrGyjGCsuwRorD9m2Fe4tlBVeQQXjiR5TOgTeSc
         NoqutLT9kxf+dBtbwTyBy0WsjqYGCGiZWUNZYpWQfMOrdqLqajHDl3FZJp555C6py1O2
         FWTQ==
X-Gm-Message-State: AAQBX9eUoqopzKCA/ZMmBurfiJBosqJdjKalGcTE29HCGkvUOIztkaT5
        S6AdY2ClwF/ql/Z4QHPlVLW91w==
X-Google-Smtp-Source: AKy350bZRLV0736GB98/OOVVgMdWA8rdaRMPLf7OyYeRzhL2CW5/UPv8yUWeQBjfU/MAsa0lXvLmgw==
X-Received: by 2002:a17:906:53cf:b0:931:8221:e168 with SMTP id p15-20020a17090653cf00b009318221e168mr2043154ejo.57.1680875485544;
        Fri, 07 Apr 2023 06:51:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b20f:8824:c926:8299? ([2a02:810d:15c0:828:b20f:8824:c926:8299])
        by smtp.gmail.com with ESMTPSA id z4-20020a170906814400b0093018c7c07dsm2075718ejw.82.2023.04.07.06.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 06:51:25 -0700 (PDT)
Message-ID: <1bf350ed-0a05-097a-57f9-4ea04fdc29f2@linaro.org>
Date:   Fri, 7 Apr 2023 15:51:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom: adsp: Allow
 firmware-name
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230407-topic-msm_dtb-v1-0-6efb4196f51f@linaro.org>
 <20230407-topic-msm_dtb-v1-2-6efb4196f51f@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230407-topic-msm_dtb-v1-2-6efb4196f51f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/04/2023 15:28, Konrad Dybcio wrote:
> firmware-name has been with us for a long long time. Allow it to fix
> warnings like this:
> 
> qcom/sdm845-oneplus-enchilada.dtb: remoteproc-cdsp: Unevaluated properties
> are not allowed ('firmware-name' was unexpected)
> 

https://lore.kernel.org/all/5fa6d988-b51a-7c18-b605-ab99ecec8bea@linaro.org/

Just rebase on my pending work if you want to avoid duplicates...

Best regards,
Krzysztof

