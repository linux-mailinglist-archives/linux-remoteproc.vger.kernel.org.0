Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFEE71A7AE8
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Apr 2020 14:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502067AbgDNMgl (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Apr 2020 08:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2502063AbgDNMgj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Apr 2020 08:36:39 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3436C061A0C
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 05:36:39 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id m4so13000622ioq.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 05:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=93PxLx/bBhSXZHPMANtDysGYDalKpS3C/enNpIgyfaA=;
        b=oDhVu2wG3zhmPrmqPL0/4JjUoRVazgmBRZk4h1cE9oPa3GmmtDVTpeZGk19tYNQmwQ
         lh+ajsWoGSL9FcZmIQKLE1LWXy6QcKZ6kddBJVw57rQtc5Bl89X72wPKbRQJuUpUrJdB
         wRXOK4w8Nm5oT+D8fY9nFK4zscL2/OrKKm79fgyl0MoTymdV8KfbL7LStioAl+hg3yEA
         PHSt5bq9omK9Ul9wZ6aDHoBm/K9TH/fAiH7Rr7ghh/hTCEH5ETC5K6zuABHAzzixS0ul
         b8aocmIq9tM17Kxal9BPhFXJ9K1EI2LkLPzxT13IPcJrfYFLfxB2rC5hdE/+pkb680wN
         Zgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=93PxLx/bBhSXZHPMANtDysGYDalKpS3C/enNpIgyfaA=;
        b=rGKgb6rnt2FjSTo3QCzLyQvEeT16ai33toG36GhKDXWiMyXOkiYrHM5JuKMTxOB8nY
         rkNL7qeiYN2rwUst4+IBjZ7opFuiSOyotmp0WtO0RNXqkTr8P+/CxA9bvRI5wmVbm3uX
         BEs+YXfojT3DC1hBxTbV+udmeBl0D8q4AJ7NzukVTQz94vejEcokXpoYBXzpra8ap6mq
         dwRzlx9vQC+KKTxNWgJbutgnRUc1Ipp2TnR8qtZus62JURxFkKB2Gp5dTSmcJoH7r2Bh
         1euh+kBUYMONZLsa4EzsH0abR4XCkf/dqe1RssJilp5oC0ibH/sqo3ccqzSN4FAaof84
         HzKw==
X-Gm-Message-State: AGi0PuaKcyS9Lpevc5eZj+3uAjoKqQ/8RTQBDT+LXN+tXBeo6SCH1zQN
        ljk5AeKAyDtVLtHFwY3u5/VQaQ==
X-Google-Smtp-Source: APiQypIHLgsSAAgr45LYobbDafEn2cSAk7E4X70gOIxDTh0w02hjQaH2p409t+miWUGfGpliZ4WtGw==
X-Received: by 2002:a05:6638:3f1:: with SMTP id s17mr4751189jaq.44.1586867799011;
        Tue, 14 Apr 2020 05:36:39 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id j20sm4442418iok.54.2020.04.14.05.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 05:36:38 -0700 (PDT)
Subject: Re: [PATCH 2/4] remoteproc: Split firmware name allocation from
 rproc_alloc()
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>, ohad@wizery.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200413193401.27234-1-mathieu.poirier@linaro.org>
 <20200413193401.27234-3-mathieu.poirier@linaro.org>
 <bd8cc8d5-94c1-5767-d089-535731fc1055@linaro.org>
 <20200414005506.GG20625@builder.lan>
From:   Alex Elder <elder@linaro.org>
Message-ID: <73c2c86d-cc4a-9706-458b-02a522528eaf@linaro.org>
Date:   Tue, 14 Apr 2020 07:36:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414005506.GG20625@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 4/13/20 7:55 PM, Bjorn Andersson wrote:
> On Mon 13 Apr 13:56 PDT 2020, Alex Elder wrote:
> 
>> On 4/13/20 2:33 PM, Mathieu Poirier wrote:
>>> Make the firmware name allocation a function on its own in order to
>>> introduce more flexibility to function rproc_alloc().
>>>
>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

. . .

>>> ---
>>>  drivers/remoteproc/remoteproc_core.c | 66 ++++++++++++++++------------
>>>  1 file changed, 39 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>> index 80056513ae71..4dee63f319ba 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -1979,6 +1979,33 @@ static const struct device_type rproc_type = {
>>>  	.release	= rproc_type_release,
>>>  };
>>>  
>>> +static int rproc_alloc_firmware(struct rproc *rproc,
>>> +				const char *name, const char *firmware)
>>> +{
>>> +	char *p, *template = "rproc-%s-fw";
>>> +	int name_len;
>>
>> Not a big deal (and maybe it's not consistent with other nearby
>> style) but template and name_len could be defined inside the
>> "if (!firmware)" block.
>>
> 
> I prefer variables declared in the beginning of the function, so I'm
> happy with this.

It should be obvious that this is fine with me.

>>> +	if (!firmware) {
>>> +		/*
>>> +		 * If the caller didn't pass in a firmware name then
>>> +		 * construct a default name.
>>> +		 */
>>> +		name_len = strlen(name) + strlen(template) - 2 + 1;
>>> +		p = kmalloc(name_len, GFP_KERNEL);
>>
>>
>> I don't know if it would be an improvement, but you could
>> check for a null p value below for both cases.  I.e.:
>>
>> 		if (p)
>> 			snprintf(p, ...);
>>
> 
> Moving the common NULL check and return out seems nice, but given that
> we then have to have this positive conditional I think the end result is
> more complex.
> 
> That said, if we're not just doing a verbatim copy from rproc_alloc() I
> think we should make this function:
> 
> 	if (!firmware)
> 		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> 	else
> 		p = kstrdup_const(firmware, GFP_KERNEL);

You know, I wanted to suggest this but I didn't know the
name of the function (kasprintf()) and didn't take the time
to find it.  I wholly agree with your suggestion.

The only additional minor tweak I'd add is that I prefer
using a non-negated condition where possible, though it
doesn't always "look right."  So:

	if (firmware)
		rproc->firmware = kstrdup_const(firmware, GFP_KERNEL);
	else
		rproc->firmware = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);

					-Alex

> 	rproc->firmware = p;
> 
> 	return p ? 0 : -ENOMEM;
> 
> Regards,
> Bjorn
> 
>> (more below)
>>
>>> +		if (!p)
>>> +			return -ENOMEM;
>>> +		snprintf(p, name_len, template, name);
>>> +	} else {
>>> +		p = kstrdup(firmware, GFP_KERNEL);
>>> +		if (!p)
>>> +			return -ENOMEM;
>>> +	}
>>> +
>>
>> 	if (!p)
>> 		return -ENOMEM;
>> 	
>>> +	rproc->firmware = p;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  /**
>>>   * rproc_alloc() - allocate a remote processor handle
>>>   * @dev: the underlying device
>>> @@ -2007,42 +2034,21 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>>>  			  const char *firmware, int len)
>>>  {
>>>  	struct rproc *rproc;
>>> -	char *p, *template = "rproc-%s-fw";
>>> -	int name_len;
>>>  
>>>  	if (!dev || !name || !ops)
>>>  		return NULL;
>>>  
>>> -	if (!firmware) {
>>> -		/*
>>> -		 * If the caller didn't pass in a firmware name then
>>> -		 * construct a default name.
>>> -		 */
>>> -		name_len = strlen(name) + strlen(template) - 2 + 1;
>>> -		p = kmalloc(name_len, GFP_KERNEL);
>>> -		if (!p)
>>> -			return NULL;
>>> -		snprintf(p, name_len, template, name);
>>> -	} else {
>>> -		p = kstrdup(firmware, GFP_KERNEL);
>>> -		if (!p)
>>> -			return NULL;
>>> -	}
>>> -
>>>  	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
>>> -	if (!rproc) {
>>> -		kfree(p);
>>> +	if (!rproc)
>>>  		return NULL;
>>> -	}
>>> +
>>> +	if (rproc_alloc_firmware(rproc, name, firmware))
>>> +		goto free_rproc;
>>>  
>>>  	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
>>> -	if (!rproc->ops) {
>>> -		kfree(p);
>>> -		kfree(rproc);
>>> -		return NULL;
>>> -	}
>>> +	if (!rproc->ops)
>>> +		goto free_firmware;
>>>  
>>> -	rproc->firmware = p;
>>>  	rproc->name = name;
>>>  	rproc->priv = &rproc[1];
>>>  	rproc->auto_boot = true;
>>> @@ -2091,6 +2097,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>>>  	rproc->state = RPROC_OFFLINE;
>>>  
>>>  	return rproc;
>>> +
>>> +free_firmware:
>>> +	kfree(rproc->firmware);
>>> +free_rproc:
>>> +	kfree(rproc);
>>> +	return NULL;
>>>  }
>>>  EXPORT_SYMBOL(rproc_alloc);
>>>  
>>>
>>

