Return-Path: <linux-remoteproc+bounces-1017-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 655558956B1
	for <lists+linux-remoteproc@lfdr.de>; Tue,  2 Apr 2024 16:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19F55284BFC
	for <lists+linux-remoteproc@lfdr.de>; Tue,  2 Apr 2024 14:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F73E12BF3F;
	Tue,  2 Apr 2024 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UNc2H8In"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E5D12BF36
	for <linux-remoteproc@vger.kernel.org>; Tue,  2 Apr 2024 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712068283; cv=none; b=fsDEkpaWgzLg4u2JEe27IJn6rLSBZdhO1Q8rY6ZEZ5m68Ifi4V8AcsFe+N/nsAQPLPg63UEGd3QxCXLmJEwyXECwKXgcHURZ+i6GD+9fuMEl7K6ai5NAPwkCQvT7hVnFwMU5ANJ48b5kcSE2qGHS+xwVCsaBapmx7UbGyMzZOuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712068283; c=relaxed/simple;
	bh=NwfiDMwPxJKgQCFrhmRtRWQVQ6ckkFHhu7WqccMtMZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJVklRf8kQkbsZk24oy3kMaOIR+67tdd9oHQhRSbn88zlDfWfiPJH8XbIiJNuvxEeXQNsnm985ldY3m9BWzARzuvjmNCp/g1GHuyF79WyZQHdWA4k1+Mdfevo9U8qhwTSTbX3k0sfznQLmUpum+QBZXLwzxNWGITvpOv+mYVQ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UNc2H8In; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56c5d05128dso3836025a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Apr 2024 07:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712068280; x=1712673080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m+iZGlcgikxz1gAky52yME4Ey0d0Q399g6xWgsA5b0c=;
        b=UNc2H8In1ZEJan6aw2dbFE4eOmYC3on/vqGE7PhC1KgKu9lTmOO9ShsJsKG5+kwy//
         hZdgKOgE9Lw/18aANJ6vGJfqovZ09HhbYmBFhypZ1VWNiuMaqdVlgN5al5NYy3trHVPh
         Cv+HYy+stknzJ6jzioCfIe4WMTgDr0d+maVd7BXfQFNFJ0vLZteh5iCPHGx6Khr3pIWK
         Xf6yMLNtgb77jetDtGbgBZKh5za8ez+Lo119/Ono9dmOyxZI4o2zT5SDhJSBWS95+HQ4
         ICcGUfiDRk7MVIjpkqiJTsSQAYGxhid+gFhVHXyc7aiRJ5M92gCAx0L7GQbjyyfI2oM9
         bULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712068280; x=1712673080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+iZGlcgikxz1gAky52yME4Ey0d0Q399g6xWgsA5b0c=;
        b=WdoFbM5e23fKKizMa0518IDRRbnMyaF38NOrF+gCFx6sG1h06m6TyOJxveaFxD/Q5w
         vkb7744ZNDDPzrH035V8oWDZl2WjpIa1tg//rZ6R3KD4aBVnQovoMYAGz5hiap5eMTE/
         pdEcRxGHnkRY7+kRKXVHwYxyIXNGzO1b0mKEaN3Vd2xnbGMagp9/lo1ORwF2GoNobZUk
         5yJc38bI9DEr78BL8m/uhEAKCozS2odSMaRemgVv4YfUM0c7echiR470eeDTN+S2rHGM
         C5X77drfouhK6jMmF/khsNiS1Q7q/ztCzcMjtO3s9rJeTu6cCMm6KwDdvwH7cKJG4O5J
         pJwA==
X-Forwarded-Encrypted: i=1; AJvYcCVPh/c45UY4IDHR/zj48ix9VatC4+MsICyGImO8/hKC9v6bebSQhxL6pY4tHzQtZgNnZ2OWoNorMgmIziQYNj5GBf9msbjaSeuQ56JS2D/R5g==
X-Gm-Message-State: AOJu0YyvekVU3qpEPRCm603g2NbY/wSNqqXHihUfl/sSXYuOyf58F5OO
	qlXkwyKt+uVxZlB601f8K9o2Jp1VeayuysxRaEzA2X0Pjs8DI13yV/RnBJlIT+8=
X-Google-Smtp-Source: AGHT+IFWRjHyAcBDCQH42LTqIXtjYJnibbkqRP82NCqC80gZDFRxjFVFgCMIo9U3wAnIvQaS2BBVXA==
X-Received: by 2002:a17:906:3a91:b0:a4d:f555:fd6 with SMTP id y17-20020a1709063a9100b00a4df5550fd6mr7599990ejd.29.1712068279722;
        Tue, 02 Apr 2024 07:31:19 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id y17-20020a170906071100b00a4e6626ae21sm2874695ejb.0.2024.04.02.07.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 07:31:19 -0700 (PDT)
Message-ID: <31ec996a-5fff-4230-8987-66bb4d575c36@linaro.org>
Date: Tue, 2 Apr 2024 16:31:17 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8996: add glink-edge nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240401-msm8996-remoteproc-v1-0-f02ab47fc728@linaro.org>
 <20240401-msm8996-remoteproc-v1-2-f02ab47fc728@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <20240401-msm8996-remoteproc-v1-2-f02ab47fc728@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.03.2024 11:10 PM, Dmitry Baryshkov wrote:
> MSM8996 provides limited glink support, so add corresponding device tree
> nodes. For example the following interfaces are provided on db820c:
> 
> modem:
> 2080000.remoteproc:glink-edge.LOOPBACK_CTL_MPSS.-1.-1
> 2080000.remoteproc:glink-edge.glink_ssr.-1.-1
> 2080000.remoteproc:glink-edge.rpmsg_chrdev.0.0
> 
> adsp:
> 9300000.remoteproc:glink-edge.LOOPBACK_CTL_LPASS.-1.-1
> 9300000.remoteproc:glink-edge.glink_ssr.-1.-1
> 9300000.remoteproc:glink-edge.rpmsg_chrdev.0.0
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

