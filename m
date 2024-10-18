Return-Path: <linux-remoteproc+bounces-2463-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE8E9A3CE4
	for <lists+linux-remoteproc@lfdr.de>; Fri, 18 Oct 2024 13:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C91A1C25CAC
	for <lists+linux-remoteproc@lfdr.de>; Fri, 18 Oct 2024 11:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7BB2036F7;
	Fri, 18 Oct 2024 11:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FH1LdWY9"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5592F201020
	for <linux-remoteproc@vger.kernel.org>; Fri, 18 Oct 2024 11:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729249770; cv=none; b=Cw7chUIAtvqE7bQqKoMrWME0cXmteAF8HnLhgHPsOB76Z6MQE8aemh3lJIpKZUcyr9OuhwWgAbAzjQYHF0QpzNfmH1qF6s0SgKm+5kFUURkV3v2c33ZHg/idewylTrq49F4+CxecKcVhb8JGVvMVFfs88gUSBMk69ExLtutXAL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729249770; c=relaxed/simple;
	bh=hIRhsvJSIxKZNH+0yh8CMfYQrQrPteNJdkQamPRSlyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMABSToiSbfJBN6Bxl1vQ9WWJmBrMMvOtO8BLNW/MB/xH+ZblxnGDNb7+H2WLvBHObTdjwOHG5y7mIBUrwDC4UpRWGJ+vXJgG6fs+ksdGgB0saNsf50UtUvJlWtqdKnee0ju+uZmdp/YGJt0R4Gt6iWdweC6q9Sf47rbJUSxpGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FH1LdWY9; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f7606199so2365355e87.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Oct 2024 04:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729249767; x=1729854567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XIt2ZgCz6/2u04try8W/s+t9Roe8RkNgbgiZjheFS+w=;
        b=FH1LdWY9YLpTuXCq7TfzDZZcykgIwMOGrzwa98+sU0/yhfJKlOrqnt9YQZH5OJF2JI
         m1xVdqAehwL1RS+VwR2rp+0l4F+gUeCPVMtUYKsJxtlqtgLsC8KQnxiOUjP3LHGxZhDe
         He7Yq8lR0NtrXjbnxQwfyZuLGouxhmb0dtLVQyPDC22vzqtQWD7bKz3cU2C5PWiZ29rL
         9jZtXM2G2QUlpTsTi68Eyjr9RPpIET9a2TKRLZ6L5x1Ecn8AKd0goNARxBPxGfdA3qo/
         bgCIUgQ2HFIQwkxHYUsGnFmvGwG7V3cXIhls2X/OAor5u3MTsvXytBoMPTRge+nVYl79
         8IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729249767; x=1729854567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIt2ZgCz6/2u04try8W/s+t9Roe8RkNgbgiZjheFS+w=;
        b=hwaFFZpETOFO3W8PPD9POjOP2m6c9vq64oyzjaputDfBeb2tdwT/bM9SMw97ea9TL7
         sURP6ksrGYhlvD3zW2Ur5HYqa0uBAlJYACxY952UB4WDRT0mqxB8RA5ykCxI4h1Xgo3U
         cJkDyGvvy4TmeUP+B5m/yee+Nq35PyOhsdYtD4Tjn2f3tGPsw+dCp87TCh0H+PVDtSKQ
         h4oVR8RHE/adn/1+hPpyN7aXb+vQySF0J5IDnaxoYrFeTPi+yNWM+8InzFuRnoDw2IKv
         Vi6Xwbnjp6ZOQI31PE7G7EKbCpgdT1jemnoL6REQ91qS4gqsV6F2ke5S2kiN6yi3Fmph
         S4Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW3oPpr4L3iOtg6XJYe03dFy11qbMpbv5F06Pv8yKLtTchZsBOFfm+djYitm6WBQk+V7r5kIxLhAtg7OeO4HtJh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6d5wwBFb2D4lsie1D5UTg+Bz1FBRc7/9T5OMZerUNJgz05tV4
	dYc9u1IwNuDHq9+MyxndsfHFXGrEApkQ2c+4kAK58md9KsWHiIKHqY2QBw3NDiU=
X-Google-Smtp-Source: AGHT+IGQcoRjkME8sB/QzR808hEBcFeX1bRQ7Ps+vQJxPs0k7IOBUWWNJ5veYpKKDLhJoGJiAwODNg==
X-Received: by 2002:ac2:4c48:0:b0:539:f699:4954 with SMTP id 2adb3069b0e04-53a1546ca04mr1270371e87.58.1729249767449;
        Fri, 18 Oct 2024 04:09:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15214e7esm190571e87.259.2024.10.18.04.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 04:09:26 -0700 (PDT)
Date: Fri, 18 Oct 2024 14:09:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath11k@lists.infradead.org, kvalo@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
Message-ID: <ho24wc35ssaecs4hqqbyuqizfamr6fffrzp62v6eevprzbjmx5@qx7urvuaptqq>
References: <20241018105911.165415-1-quic_bpothuno@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018105911.165415-1-quic_bpothuno@quicinc.com>

On Fri, Oct 18, 2024 at 04:29:11PM +0530, Balaji Pothunoori wrote:
> Currently, the rproc "atomic_t power" variable is incremented during:
> a. WPSS rproc auto boot.
> b. AHB power on for ath11k.
> 
> During AHB power off (rmmod ath11k_ahb.ko), rproc_shutdown fails
> to unload the WPSS firmware because the rproc->power value is '2',
> causing the atomic_dec_and_test(&rproc->power) condition to fail.
> 
> Consequently, during AHB power on (insmod ath11k_ahb.ko),
> QMI_WLANFW_HOST_CAP_REQ_V01 fails due to the host and firmware QMI
> states being out of sync.
> 
> Fixes: 300ed425dfa9 ("remoteproc: qcom_q6v5_pas: Add SC7280 ADSP, CDSP & WPSS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> ---
> v2: updated commit text.
>     added Fixes/cc:stable tags.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

