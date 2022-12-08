Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 804E2646D47
	for <lists+linux-remoteproc@lfdr.de>; Thu,  8 Dec 2022 11:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbiLHKmV (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 8 Dec 2022 05:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbiLHKl4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Dec 2022 05:41:56 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C52E81D91
        for <linux-remoteproc@vger.kernel.org>; Thu,  8 Dec 2022 02:38:11 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id cf42so1418148lfb.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Dec 2022 02:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnjXh6srzA4hNTFwgK5oMRB4A7wsXpdJZ0W8ZXTddYA=;
        b=VzMA2sy/yYjMfgvLGX1epBgYu/dA3s6XjiuLDRqPBkE7WbF7tGDunaV1r7DEb4FN5S
         QjjnaAIYZevKBIbOhVNoI6ghLhc7MN1XbwZ9wB5aUwS29e+X11+ZsByhDVv25wj/72KB
         w8Th2wOMfE0GGHReL6yiUJqLNEdakg8c09JgvQv64COtnm4FGqfzRV2ZT8XHcPBEgKgh
         40ubl33Bii3JnJU30rE2WuLKBuPNEZ+D9Bv1Rljg5745Uk+6URwyPnqP5TkNJhT/lu66
         4dZbdbRcQAGOEavIRRiSw8cHiDwocU43ZCldGiFALkK9jPCemeNcX+89YEJF/+y4q9kV
         +fAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RnjXh6srzA4hNTFwgK5oMRB4A7wsXpdJZ0W8ZXTddYA=;
        b=Kni3feVDpr0sD5MPwfDsL1xleBYE8s9Own4qIcI1gOulml5NWh8RKMCFspdLw6W9s4
         JdOqSaCHJEj8+luJivbQFrrTss4+YtBBzBWMF8h9y0rZ3AEqjs/XTfysOloGdy3v6G9A
         CpFB860P1bHsqxtOsf7XSDiNSFD4V440RV6cIlqPiwi9BMV+gfJ3EeKe23utGmmVXNBl
         /AWjnJdlUijEIDD2dMnDtSZpheS7W9CnN7BSfvgUjExZCEMqNoJpNmLkPEcwDbO2M8rR
         SOOJY+8cWKXWSKWKEa2K4QKIDzosMxWMSDdS4SzRNTQVgohwjARD5V5Rx33mW33ZsXV7
         Tg2A==
X-Gm-Message-State: ANoB5pn+1CzHOyrlMG8xEwjuR+jEnqyUU5mVS6ff9o1KGzIN2aSCU3V3
        19vEMFIZGG/zDXcnriG1pxSnYA==
X-Google-Smtp-Source: AA0mqf6E0jLO5LLaLBE4f0zVPvXynee8OE3sUTA1JN58Zl1sfJhuv++Y/uM1QeorAs7UsOD/Hr83bA==
X-Received: by 2002:a05:6512:39d4:b0:4b3:b6db:8cb5 with SMTP id k20-20020a05651239d400b004b3b6db8cb5mr30264632lfu.599.1670495889427;
        Thu, 08 Dec 2022 02:38:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v1-20020a056512348100b004b575d239besm1553607lfr.237.2022.12.08.02.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 02:38:09 -0800 (PST)
Message-ID: <7df45cef-ce99-5931-b3a5-32ded8df6d2f@linaro.org>
Date:   Thu, 8 Dec 2022 11:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 2/5] dt-bindings: remoteproc: qcom: adsp: document
 sm8550 adsp, cdsp & mpss compatible
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-remoteproc-v3-0-62162a1df718@linaro.org>
 <20221114-narmstrong-sm8550-upstream-remoteproc-v3-2-62162a1df718@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-remoteproc-v3-2-62162a1df718@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/12/2022 20:23, Neil Armstrong wrote:
> This documents the compatible for the component used to boot the
> aDSP, cDSP and MPSS on the SM8550 SoC.
> 
> The SM8550 boot process on SM8550 now requires a secondary "Devicetree"
> firmware to be passed along the main Firmware, and the cDSP a new power
> domain named "NSP".
> 
> A third memory domain for the DSM memory zone is also needed for the MPSS
> PAS bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

