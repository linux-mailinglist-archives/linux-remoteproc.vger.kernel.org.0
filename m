Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C49995AFEE5
	for <lists+linux-remoteproc@lfdr.de>; Wed,  7 Sep 2022 10:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiIGIXi (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 7 Sep 2022 04:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiIGIX2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Sep 2022 04:23:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7EDAA347
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Sep 2022 01:23:27 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bt10so21271926lfb.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Sep 2022 01:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=PMffZexfhPxUf0YHZ8IhoN7MwL1ZPf0n44VkkEDS57M=;
        b=yYH6ZJP1hi7hz49sPr0A7ZzxmO+zviqS3k4RQfh7vETXvcV+RtB8a68Y1PvcZSocoE
         aJKF76dJdcbpQ7uuFSRU3UpQyjj2/jDe4sC6Uy9EQQ/5o2wpFGTalTiKmIcZ7wEJsNNx
         4j1bF8ySH8V47EtLL/NhRr8vbNgnJrZAQMnD+F4nqge42pwNjPDD4EJRELgw0XXzkJ08
         J1Ygh73Vq2NCFycDpuo1Jcm8m12CUTVPQGi1oAolgyUKgU77+oDm98/IEir++HoW9btl
         nMtsmsYMkWyfVjMBBi8Mux7KY0wKQ7KnfqMO+2ofOFIInL4eIyUz4V1EaNoCrMbyHvKA
         LEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=PMffZexfhPxUf0YHZ8IhoN7MwL1ZPf0n44VkkEDS57M=;
        b=6REi/pEzeGCJ0ntMeyZiO6iQrrvnZWmiZbJQO5rXL+ehuGe/0L2J1DzFT5wkc/wayJ
         R731w6tyIF8ilGcepctf3mhzaBriNEEumAnDQDVp3XFFeQAJtO6P9LAgwxIx0g8ybvpZ
         n7aRf7UMFjcwovbKjU32WmuyKzfapFdVkSY7iq6Y5wVp3meB5L+n4F5nvmGXXwaPJNDe
         iV+dTCeNj3AKMDr3vjdIOP75wkyYdO8u8fBzEftRI9KVUayXtfN1qyQk7s8QGm6w1FKE
         MSEqtU1LqKdJdJqMd02bJbXi9flu18Szzav+Uh32hQO+HXu1IJNh/eO6NUMddseST6Od
         KYxA==
X-Gm-Message-State: ACgBeo02pCFhLPoh9+tmmfJgqllwsBc5qKx2j7mdwn8/NnsDzipc2M7P
        jI7z6/2f2M5TaonzDl0VU0DmFg==
X-Google-Smtp-Source: AA6agR5QYYhRNSKsahw3GggztqRGmZaan4egYMA//IRllSYSBi1GGWREmQ96xwI88a8Q4T/kP8mesA==
X-Received: by 2002:a19:380e:0:b0:497:7968:e789 with SMTP id f14-20020a19380e000000b004977968e789mr715368lfa.242.1662539005327;
        Wed, 07 Sep 2022 01:23:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g5-20020a056512118500b00492df78f311sm2312204lfr.57.2022.09.07.01.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 01:23:24 -0700 (PDT)
Message-ID: <e3367f73-c2da-3f6d-59a4-209efb114d9e@linaro.org>
Date:   Wed, 7 Sep 2022 10:23:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] remoteproc: report firmware name on load failures
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220831161736.749932-1-krzysztof.kozlowski@linaro.org>
 <20220906194622.GB64477@p14s>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906194622.GB64477@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 06/09/2022 21:46, Mathieu Poirier wrote:
> On Wed, Aug 31, 2022 at 07:17:36PM +0300, Krzysztof Kozlowski wrote:
>> remoteproc error messages like:
>>   remoteproc remoteproc0: request_firmware failed: -2
>>   remoteproc remoteproc1: request_firmware failed: -2
>> are difficult to debug as one actually have no clue which device
>> reported it and which firmware is missing.  Be verbose and print the
>> name of the failed firmware.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index e5279ed9a8d7..71cd7ed7a970 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1923,7 +1923,8 @@ int rproc_trigger_recovery(struct rproc *rproc)
>>  	/* load firmware */
>>  	ret = request_firmware(&firmware_p, rproc->firmware, dev);
>>  	if (ret < 0) {
>> -		dev_err(dev, "request_firmware failed: %d\n", ret);
>> +		dev_err(dev, "request_firmware %s failed: %d\n",
>> +			rproc->firmware, ret);
>>  		goto unlock_mutex;
>>  	}
>>  
>> @@ -2023,7 +2024,8 @@ int rproc_boot(struct rproc *rproc)
>>  		/* load firmware */
>>  		ret = request_firmware(&firmware_p, rproc->firmware, dev);
>>  		if (ret < 0) {
>> -			dev_err(dev, "request_firmware failed: %d\n", ret);
>> +			dev_err(dev, "request_firmware %s failed: %d\n",
>> +				rproc->firmware, ret);
> 
> That information is already available in sysfs 

Hm, it's not in deferred probe reasons, so where can I find it in sysfs?

> but if you are really keen on it
> please do the same for rproc_trigger_auto_boot().
Sure.

Best regards,
Krzysztof
