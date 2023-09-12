Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8D3F79CC7C
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Sep 2023 11:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbjILJy2 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 12 Sep 2023 05:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232982AbjILJy0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Sep 2023 05:54:26 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C24E5F
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 02:54:22 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31c5c06e8bbso5466926f8f.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 02:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694512461; x=1695117261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=quEjwIEwQhvi6S4NasXoKOetPehrd0RF3qKdIQ0l7t4=;
        b=pFixrEGr0Vy244obJP3vN3izKAVNijZCFCPAw6O4FIC8d+s7qgL+wv+lVJW1j8n0nx
         MS9+Ve/64bzjAGznChmIwrwrBftfijOHdeePG+T0jeY/O36V/T8vWkUmmIO628OHHHNl
         z0Jsxe70T8dh/E3xzfAIWZjFKXUpiI82W9ASGHTqwuSphIfnbSuGRIx1/sqQdJHyho9g
         wiCxSYrURnjbjrglQkYW1BrOcss/LdZHdHpaYx567rDOID32nxdHHxm8MmzFsU8ovx3v
         0aFwh5/9ipMcdyxOfZ+0/p3bzqWMh++WPqfLH8lPTAeXrJnOzdFdcBhr2y0hcaY4R9l2
         PuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694512461; x=1695117261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quEjwIEwQhvi6S4NasXoKOetPehrd0RF3qKdIQ0l7t4=;
        b=dcxZCmsxIZ1ztVyGAw4VV1sKQ1mwSfZk7Hv3srpc6CSgEIJnErHYYgzSDG5ADveAJR
         RagLuEPqPgoIvmyFNXaAGrnCtWLTX/G8ZOfnY1pB02ICvJ7gLp3SMk6GLtPVtlDKsvIC
         KXiPqkFY3CngbzuNwe4YYVNrNIqhBqPgDa1siZsKevjdDCTn/l4H6Oi96Bvygojw/P/j
         wn77Rgs+9uiJIoZz3d5HbvniQMKGTXPdFtt82of3pPEU7vpK7RJ7wLFH3FA5PW2nd95Z
         Z7F+lAM/GBjg95V2P7sqE9lt39N+8rMzSF+YC+XcDzQ+N5s27abRa6D5L4huqtCazHXL
         4TYQ==
X-Gm-Message-State: AOJu0YyaSkI514l4QlgunKzywDd8B589rtd0wmA490vlK/G8d7dviWY4
        wH6fp+EuRh9eUNT+KuTQAqxfwA==
X-Google-Smtp-Source: AGHT+IFnQg3ALYeJgAkk0jJC2jJChoqUbPD4jYDvz6vnfv5QkI7TVMzsvOUXJ6xATfIAfJduc6Y6Mg==
X-Received: by 2002:a5d:494f:0:b0:319:7b57:8dc5 with SMTP id r15-20020a5d494f000000b003197b578dc5mr9302315wrs.54.1694512461287;
        Tue, 12 Sep 2023 02:54:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id e10-20020adf9bca000000b003143cb109d5sm9999941wrc.14.2023.09.12.02.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 02:54:20 -0700 (PDT)
Message-ID: <94770fc6-7d72-8283-5858-786685620d5c@linaro.org>
Date:   Tue, 12 Sep 2023 11:54:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 06/17] soc: qcom: Add Qualcomm APSS minidump kernel
 driver
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
 <1694290578-17733-7-git-send-email-quic_mojha@quicinc.com>
 <3bb1e84f-3b65-0596-1b6b-6decb0ff53cc@linaro.org>
 <0eeef9c4-14c0-8283-803b-4684854d4be6@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0eeef9c4-14c0-8283-803b-4684854d4be6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/09/2023 11:26, Mukesh Ojha wrote:
>>
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	mutex_init(&md->md_lock);
>>> +	ret = qcom_apss_md_table_init(md, &mdgtoc->subsystems[MINIDUMP_APSS_DESC]);
>>> +	if (ret) {
>>> +		dev_err(md->dev, "apss minidump initialization failed: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	/* First entry would be ELF header */
>>> +	ret = qcom_md_add_elfheader(md);
>>> +	if (ret) {
>>> +		dev_err(md->dev, "Failed to add elf header: %d\n", ret);
>>> +		memset(md->apss_data->md_ss_toc, 0, sizeof(struct minidump_subsystem));
>>
>> Why do you need it?
> 
> Earlier, i got comment about clearing the SS TOC(subsystem table of 
> content) which is shared with other SS and it will have stale values.

OK, but then the entire code is poorly readable. First, any cleanup of
qcom_apss_md_table_init() should be named similarly, e.g.
qcom_apss_md_table_clean() or qcom_apss_md_table_exit() or whatever
seems feasible.

Second, shouldn't writing to shared memory be the last step? Step which
cannot fail and there is no cleanup afterwards (like
platform_set_drvdata)? I don't enjoy looking at this interface...



Best regards,
Krzysztof

