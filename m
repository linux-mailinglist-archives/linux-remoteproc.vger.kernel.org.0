Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF06792755
	for <lists+linux-remoteproc@lfdr.de>; Tue,  5 Sep 2023 18:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238578AbjIEQG1 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 5 Sep 2023 12:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353677AbjIEHMm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Sep 2023 03:12:42 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8C0CD2
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Sep 2023 00:12:37 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-529fb04a234so2819193a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Sep 2023 00:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693897956; x=1694502756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sF+//heit9kiu9DZdcMd4FMMmLNhwcRdwSW09zQAWOg=;
        b=isa7PacI5seuzKqipK6cQKBBfbBM5EIM2Xgaj7pb8F4PXL68hO6GffAhM/E16DO3LV
         jjGvzEnvSCjfiMjIU0jdwPn8EUSWy7+27VVHC/gHXsz7UeAmjeULRTQtFRaUzrScEQzL
         2lMZuCZ7eMyoRZ6UKpl6E3Aq1KSxosW1bZYTjZHZ7SKvTTioaJ5jqbCbGEQWtME9vGVg
         HuZ7lH53G48Wh1lznK45/qoAjaJpTdDWTVgq1JOHcVskQ4rOXNDN0KqR2Semm+2+b2qo
         4lAdE6lpK3iyfNoSFbQp9c9iyZagi3udSgud5riuHpWYNKPLFGK/nqGYoQBCVrMPL+TS
         q61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693897956; x=1694502756;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sF+//heit9kiu9DZdcMd4FMMmLNhwcRdwSW09zQAWOg=;
        b=Y2d4Y9dKTKo/uVXSOaGGblsDM+47IsRNmoTIaovUi1UNgwegOkUsZXWDuo0Bnjs+c/
         wZ1Lm7Ethd0H8sey4NUiHhdMaIbho3vxwDz64f4ph/0hWVBkzQbmaQh1m6rFqUL+ux1V
         zs5T8M7e5RWJHbpvjaGfoOhsoJV20hf832FmmSjj2tMh1g4kgZRB1npguQGFzUq1crUk
         njyAqDDyeqHn6vqHb482SsvoGyPIKRm6TZsd+IMIMGiXu69yVxPtQ3uiNxjh+0SVFxFb
         IAYdqGlwOfS/eq1K3sf08at2AjK+dPRbjnmUh0+pLpYLSxAq4pn8rSsIQTWKYI/msx6b
         u+Dg==
X-Gm-Message-State: AOJu0Yzhnfm/y6Qe89xt8/qE8ISNHNBlTr1456KZqWMza7MqrDn5MwrR
        wk79eLj979KStfoQZsrNU0U4ow==
X-Google-Smtp-Source: AGHT+IGhDjhTiNFdEFIcr+XHptJkx79UC35MF9x3IJyzuQCD+VOKolPpsbSAb+Gvg9FRn2zUMnFRfQ==
X-Received: by 2002:a17:906:1dd:b0:9a4:ea7a:d0bb with SMTP id 29-20020a17090601dd00b009a4ea7ad0bbmr9129627ejj.76.1693897956325;
        Tue, 05 Sep 2023 00:12:36 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709060ac700b0098d2d219649sm7291746ejf.174.2023.09.05.00.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 00:12:35 -0700 (PDT)
Message-ID: <7d0200c6-0a87-54fd-5909-e4076dfc0a0e@linaro.org>
Date:   Tue, 5 Sep 2023 09:12:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc7180: Add ADSP
Content-Language: en-US
To:     Nikita Travkin <nikita@trvn.ru>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     David Wronek <davidwronek@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230905-sc7180-adsp-rproc-v1-0-dfea7699da7b@trvn.ru>
 <20230905-sc7180-adsp-rproc-v1-4-dfea7699da7b@trvn.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230905-sc7180-adsp-rproc-v1-4-dfea7699da7b@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 05/09/2023 07:47, Nikita Travkin wrote:
> +				apr {
> +					compatible = "qcom,apr-v2";
> +					qcom,glink-channels = "apr_audio_svc";
> +					qcom,apr-domain = <APR_DOMAIN_ADSP>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					apr-service@3 {

Except missing tests, few more things to fix

> +						reg = <APR_SVC_ADSP_CORE>;
> +						compatible = "qcom,q6core";

compatible is always the first property.

> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +					};
> +
> +					q6afe: apr-service@4 {
> +						compatible = "qcom,q6afe";
> +						reg = <APR_SVC_AFE>;
> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +
> +						q6afedai: dais {
> +							compatible = "qcom,q6afe-dais";
> +							#address-cells = <1>;
> +							#size-cells = <0>;

You do not have any children, so drop these two. I will fix the binding.

> +							#sound-dai-cells = <1>;
> +						};
> +
> +						q6afecc: cc {
> +							compatible = "qcom,q6afe-clocks";
> +							#clock-cells = <2>;
> +						};
> +					};
> +
> +					q6asm: apr-service@7 {
> +						compatible = "qcom,q6asm";
> +						reg = <APR_SVC_ASM>;
> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +
> +						q6asmdai: dais {
> +							compatible = "qcom,q6asm-dais";
> +							#address-cells = <1>;
> +							#size-cells = <0>;

Ditto

> +							#sound-dai-cells = <1>;
> +							iommus = <&apps_smmu 0x1001 0x0>;
> +						};
> +					};
> +
> +					q6adm: apr-service@8 {
> +						compatible = "qcom,q6adm";
> +						reg = <APR_SVC_ADM>;
> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +
> +						q6routing: routing {
> +							compatible = "qcom,q6adm-routing";
> +							#sound-dai-cells = <0>;
> +						};
> +					};
> +				};


Best regards,
Krzysztof

