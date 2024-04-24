Return-Path: <linux-remoteproc+bounces-1206-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2618B1450
	for <lists+linux-remoteproc@lfdr.de>; Wed, 24 Apr 2024 22:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE415289322
	for <lists+linux-remoteproc@lfdr.de>; Wed, 24 Apr 2024 20:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C79143C4E;
	Wed, 24 Apr 2024 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RrqdHiPR"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DFD14389A
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 20:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713989673; cv=none; b=aSt4XQqkaurjn+d+AnW2KTqL1AOr8ktCd90TZ26nJrJQoeu/YB962BZZVBIbe9Z7wmz6fWQ/vDA+TKUMbiFoN9usyyL18T5I5p5XtQoJjtDqIhjeqTw1VnSwzWE4Qv06uCU1VIIIcTdIukA8EKyIHXdWTXc89mlH8/JrnSrMXds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713989673; c=relaxed/simple;
	bh=5juKDdGEYxNl2ENPjsF/4a/Y2iZb9ON1oaGj0sw8O/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSAhwkZcqtKkVdUAs+XXFYtPyT7S4iqNBvytm56JjhsKyQK8Cz+cfNdpaO1XfkA8dkBzuGqBCwRUx3dTPbGeIS/StVzh+/YfV4+JIAXi90cvGtmo2UKIEJjyXsT0nGKLGC5svIZxai9srp7pl9lRPMiZxZ3S0U1Pw1alqXBXD7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RrqdHiPR; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51ae315bb20so266894e87.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 13:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713989669; x=1714594469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rcWOpWv1JwDPxWKBqvGmsKPJY5XCaFq86YjpwkCYxAM=;
        b=RrqdHiPRlzFgB/YHAMjNRtEi7bA1Korr7bo5TaSAuiPLAgpN6Gg3Qprhmnfoij7Rmn
         ddbEX2E9guF73Gl/qxCubSjrKEgeOaLY7ph20jVyt1pvkm8s+yFa4ikJwy8vLJlFdzcL
         SejCQ3VfanAHPgQu9t4A2kxM1wq6Igs/BJqyd0ja+/aH3It3Clm/2LHdogFICDVdpAVW
         ukYfXsKeQNklSqDgciqkSIIz2t0FoG5gJYKW3VCvhybAqp0ddcvRvCg/bEtCXLHDDOcT
         WKf5ucguoxopL7hJuVLRKs4P2aSuJHDivsRDBV1bq/ihs2z4ytXPGRQOXyYWhBZSipy+
         ENfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713989669; x=1714594469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcWOpWv1JwDPxWKBqvGmsKPJY5XCaFq86YjpwkCYxAM=;
        b=Yqqe+nSna+kF8X1X3G8rGeLwnVK9DUYcwCTj19dEL7Xyhlk0NFwpWJYsNXjHGxAXr0
         31KnW1miajhY9NAR1/ys0jsxXhCJ6qT3qPUmPeTe6m9a1Y/49ziPHMYqYwOjEbseTaoU
         db6oIkdbZy+RST5rXqIfis7YpVnQyfX2c74AudEUdhys5vS4DUI/w3L60ECK9i9lTWZo
         kGnCfsPJ+Wky1FyKHMUFXMHimIHFIA0xccasWQJ7LhgDaW+4lH6r3i+YmEA1ihs0r9Tb
         5/OnnGx2ha0faxeWy2eQht48wVFXxnxHyB3VUwPy8UYfzk3eRW2XJsrFmZkWwI3pQGG2
         w2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGPkesSSZ6Xga2f+tYzB/Sq/Dv3LX/Lh81G7+xbzLaNEV4KGjSTQP/RIg1wyS/tgNBqlPsnnTkn0yAAn7ZskSweSMP9dNp2mrGR7N4/viNGw==
X-Gm-Message-State: AOJu0Ywnbmezg5ICchSRaWMEWaYYVh3sO3yww3r6hQGDb6Cckzw1XFTd
	qluYbH48FLALAyPNCpcXpBU6ssfa6PBq/nITGpm5LF1lArFff55kXxUcEUf+Xi4=
X-Google-Smtp-Source: AGHT+IFIzbbNTj6m6kGkpPa8i8ekvwbmU0oCByomId+50qDRUiDv1Koq7Q2A9H7ah8qGTSTuaqVT6g==
X-Received: by 2002:ac2:4887:0:b0:519:5acc:b114 with SMTP id x7-20020ac24887000000b005195accb114mr2433319lfc.45.1713989669504;
        Wed, 24 Apr 2024 13:14:29 -0700 (PDT)
Received: from [172.30.204.223] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id s6-20020a197706000000b00518d7c38cb9sm2567308lfc.284.2024.04.24.13.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 13:14:28 -0700 (PDT)
Message-ID: <4d941a6f-ba47-4c1a-94c6-cad24c6f59cf@linaro.org>
Date: Wed, 24 Apr 2024 22:14:26 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: msm8939: Use mboxes properties for
 APCS
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz>
 <20240424-apcs-mboxes-v1-4-6556c47cb501@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240424-apcs-mboxes-v1-4-6556c47cb501@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/24/24 18:23, Luca Weiss wrote:
> Instead of passing the syscon to the various nodes, use the mbox
> interface using the mboxes property.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

