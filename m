Return-Path: <linux-remoteproc+bounces-1693-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 193D9915FC5
	for <lists+linux-remoteproc@lfdr.de>; Tue, 25 Jun 2024 09:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C89D628139C
	for <lists+linux-remoteproc@lfdr.de>; Tue, 25 Jun 2024 07:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC63146A74;
	Tue, 25 Jun 2024 07:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vXmifm8q"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDAA1465BA
	for <linux-remoteproc@vger.kernel.org>; Tue, 25 Jun 2024 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719299639; cv=none; b=lKEO1Vjuk2ljK7wnOghs0b163FJ+syv99nrlQ74aP0ZmfUFx+AkukflNDdz6XP9rxzfRm/2+o6RZk85YvOsnZBIVVEcGCKsSik9aI4roHbry7GOrmASzsIQFtyc4qqGmQ9OtQf2zJHg2Ip2wueoAsdLWU8ULf6b+RDSLv0WIOno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719299639; c=relaxed/simple;
	bh=M0PusBwUOnvIKi4gdlLdWjip9P0B6wyISd2JaNhue0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekvUszgr8N1yTdQfbW2KEyHIA7rLwkHUzLW4fQ9QU9GLH9Mdjry73b8fXc9IGFz7CGWyPU3A8WR4VkQiNLUO68mRFeKijjsdoNr7wvzBuzaaBpebnpLWGd8VQvyy0vGSXdd6YJmKKP5f1n3/IVfBQ2bGf9uNdGrkfhDQbu8XGYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vXmifm8q; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cd80e55efso6158664e87.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 Jun 2024 00:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719299635; x=1719904435; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dzKPriaP/94IulqToxJJrPFAwt2XeR1A21mNIKltOqQ=;
        b=vXmifm8q/8E5agcvZoJRFXS/zmOUa5QSFcvCZpOm3ZkFXx2PCkHMiAyn2BFChQP5Pu
         BKSM3cUytxBEtk0/eMNWWvh20Yp8vEEBqVbXiAW2DZNTyneXlG5PBoUDZS6fdfUqylkR
         aUwnPjqLNcPaN9Sva7E5zEpbGaoJTTXspyhdNedhwpjnE0Ag7i76kvLoP+7OYsU04IgA
         qP9eaIYz0MslDR4eQhHs+Jmlg4TyBNm52LPYVyFBu+Eo2x1B9VU/yCsFIg1P5zCELiIC
         eEK9ocgXWDclrGO/QAu1biEYJ0Fe3q+MFa8y8tEVlctxqzD59LFXGICjn5vOZfujkMr0
         zHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719299635; x=1719904435;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzKPriaP/94IulqToxJJrPFAwt2XeR1A21mNIKltOqQ=;
        b=rsDfT4foH9vuPnuMrRpSv9/qY3z91UUaQkjgoOe7ZGlTfi3cQYFTQO7/H4KqQz6DNm
         QeM5PTtQeFrcMQ7zRT8NuyCLlp4BzD0fY/1n71lwS35cIqVxHxbZDJDaQOutT/Gm8aKu
         IaF1DnP7wiGfQLA/jmrpwR3C6al/1Cm6AD527ByTTMAuoGDc3MTLiIBwLr6N0uOoC7zU
         dlIHIPVr9hK8ppTaEU34h/ure5dyFGoyZHmz5FTmu4whYc4bpyqiJOE3AL4fRXuNzO0x
         UClggqq+VDJKIOv4YmcJ7OJZEzsFLBHr8TRskpO/ObeJ8/2xwV8y6XCFdM7Itup9yZ5q
         i9iw==
X-Forwarded-Encrypted: i=1; AJvYcCV71l4+TJVYd89bF+RsTeypvIDoMzNxucEiv7hri20Kx8d14m2PWSdumHxrr45SWypRnvG/owVtVvM4s7b15kbJbEH4oauBOb8OoU/pBPPhBQ==
X-Gm-Message-State: AOJu0Yw6LgWMhZTOoKOFtj1xmhBit8by/ZrhH0pJfbZFrxrCQkRtIIKK
	mm6BUQmzXZT0z6Fy5NetwNURAPhft4J7HzigdOz9XEKp5eqXIn9UhBQojdDeOyY=
X-Google-Smtp-Source: AGHT+IG64J5RDl5yaNGvIky6EGoSsPTbRPhzUi9sDW1lxe4MxCOfYS/ESUmKFf0+XtJh628T1VqfDg==
X-Received: by 2002:a05:6512:308c:b0:52c:c9e4:3291 with SMTP id 2adb3069b0e04-52ce185ce9amr6238633e87.60.1719299634940;
        Tue, 25 Jun 2024 00:13:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdeafa562sm820431e87.154.2024.06.25.00.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 00:13:54 -0700 (PDT)
Date: Tue, 25 Jun 2024 10:13:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Gokul Sriram P <quic_gokulsri@quicinc.com>, sboyd@kernel.org, 
	andersson@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, 
	devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, robh@kernel.org, 
	sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: Re: [PATCH v9 4/8] remoteproc: qcom: Add ssr subdevice identifier
Message-ID: <76mrajqeteocstj2akjtyk7rhfnqvksqw3fqsntlm6n3mqqaff@z343xmmunnzj>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-5-quic_gokulsri@quicinc.com>
 <d7923435-ba13-4aad-b3f1-67e3469ec7fc@kernel.org>
 <8adae0a7-d496-4c9f-ab0c-f162c06e90c4@quicinc.com>
 <87353911-b108-4b87-aa40-862acfc95aca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87353911-b108-4b87-aa40-862acfc95aca@kernel.org>

On Tue, Jun 25, 2024 at 09:04:17AM GMT, Krzysztof Kozlowski wrote:
> On 25/06/2024 08:28, Gokul Sriram P wrote:
> > 
> > On 6/21/2024 8:40 PM, Krzysztof Kozlowski wrote:
> >> On 21/06/2024 13:46, Gokul Sriram Palanisamy wrote:
> >>> Add name for ssr subdevice on IPQ8074 SoC.
> >> Why?
> >  � Oops! Missed the change. Will add and update.
> >>> Signed-off-by: Nikhil Prakash V<quic_nprakash@quicinc.com>
> >>> Signed-off-by: Sricharan R<quic_srichara@quicinc.com>
> >>> Signed-off-by: Gokul Sriram Palanisamy<quic_gokulsri@quicinc.com>
> >> Three people developed that single line?
> >>
> >> Something is really odd with your DCO chain.
> >  �The change was originally authored by Nikhil and reviewed by 
> > Sricharan. I'm just submitting the change to upstream so retained their 
> > names.
> >>
> 
> Then your DCO chain is not correct. Please carefully read submitting
> patches, especially documents about authorship, DCO, reviewed tags.

Also there should be From: Nikhil header before the patch.

-- 
With best wishes
Dmitry

