Return-Path: <linux-remoteproc+bounces-2611-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 564BB9BCD3B
	for <lists+linux-remoteproc@lfdr.de>; Tue,  5 Nov 2024 14:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CF6F1F22407
	for <lists+linux-remoteproc@lfdr.de>; Tue,  5 Nov 2024 13:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEA91D5AD4;
	Tue,  5 Nov 2024 13:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMfwgyvr"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8381D54F7
	for <linux-remoteproc@vger.kernel.org>; Tue,  5 Nov 2024 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730811666; cv=none; b=fSdUtteK/SASCa8t6+wibDyjsBPxsnCgRbHQ5XBs9PUG3b0KcC44wRsOpaeiuz4qjXJU6VO8fGoyPyXkcdXaB2YTs/wp++njxc5W/tw4HtdnBTyofm+qIi5dMHqkEcYd0ubXeXgcbWbjmZ8GzRO07xCfg9sYAPrp6xxENoRSe8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730811666; c=relaxed/simple;
	bh=D0WTw+MUtdg41qhocX1Oe1iRLsKsP8vyHesg6BiksAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMGRL2DLkTusUyMOA7ecS94knb8CsGq7i9ThGqC8KkvhVG/mjX1cC11Q7lXKDzv+hvhq02S2t29eCVvEvgXW659QOts9g74104agO/gMkctg06ZmPAlkIhJgnkHSZu6yQWkHyWZ1S/BRQ2rnalxllISvSWP6q0os85BtKH+3QS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pMfwgyvr; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c96b2a10e1so7719724a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Nov 2024 05:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730811663; x=1731416463; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D0WTw+MUtdg41qhocX1Oe1iRLsKsP8vyHesg6BiksAA=;
        b=pMfwgyvr9BHIvYoDsMTV8qvik4euwFpld8TvEJQAbogrITOmthop4cO78gqWWhcymj
         ZbYGMEuUQqIl/biCagL4GOSavABXbj+JnQWGRuzLNIiQHH2gR73cCB5hjTNtmhx4AO1R
         3aDT8XzQ5CLZZXKEHP+z+w1lrNTFB2jvokBlLbwg7miir+5o2Ypax9uN7EMeSNP50GFw
         zq2nU8Aefh6jbF7r556J2jTdI2ESJVvsK/H3EUh3ZugjQruC3jvmTWubzzL9jlytO8ZY
         L3RrM0d6cL+/s8PhlUYkTJ7rILagsxJwPObDun5A+fjc3iDo4+eYzQPjEY9dq+gzAyJ7
         ZwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730811663; x=1731416463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0WTw+MUtdg41qhocX1Oe1iRLsKsP8vyHesg6BiksAA=;
        b=B41Dx/lAm2KJn08c+Qy75oupf9isq6i2pEeuZ4DvnhjKiwsiWit6zUNdF7hetM93oM
         Logb4648w40kgxooS1AZnBfS56bKNc+awyQ0NjqIow0mb27umiWdEsrYVtxdUcy1Xv98
         OkjPI1UW9//+g31ghOcFH2fWqXX8O3J3IrQLw/+pybc6OxbsQHdA5sxsgaIIAQd+ZZ19
         DHsS9xDfVFGT1sXqps1YJTV45RbewZgcJPvR2vjIgvDKbJFdsvIQYY0wCsK/Z6qPA1l7
         VyIyFrjXiqPIM1L2DKvUu5EADeH/X8yMtL5HRDLH49wRLoTABVtIGNcSCHDEnOMswaYN
         LHUg==
X-Forwarded-Encrypted: i=1; AJvYcCVH33fnZpgXNi+idKkLr0vz7x+JDn9ntoK2befrb9IN3hGle+FqJCAEbWsAr6YgKeEswxJmb49O60nWwvxkMd8q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1s6sXuSQAY/bpJtgcKTmL1vzwghc0zSXtT92XNgdasa2BqwX0
	tealYUutR8ySwjxPDOgbxnLbj9nzsPU101hvE5fUhnZqxHw33HTshhIOAPVVBm0+SyDp5FHnCgq
	nQCvTnQ65eGMSIoUXPPtDtxCqjhfYqJHoeVi8Jg==
X-Google-Smtp-Source: AGHT+IGdKsOe4uUI+pQsDjBeFjVYPEKnH5Eo7FvRYwbGqpXjSLbX+ykZRbMa+upNnN9HPEwQU7Vdq7xJqtyj1W3FckE=
X-Received: by 2002:a05:6402:3508:b0:5ce:ddd6:d100 with SMTP id
 4fb4d7f45d1cf-5ceddd6d143mr3955032a12.32.1730811661239; Tue, 05 Nov 2024
 05:01:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105004749.83424-1-yesanishhere@gmail.com>
In-Reply-To: <20241105004749.83424-1-yesanishhere@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 5 Nov 2024 06:00:48 -0700
Message-ID: <CANLsYkxKteXHMvG3GfPOKz1G_NfQV8D0D4JxYeF0ZmiYv=Mviw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Documentation: remoteproc: update various sections
To: anish kumar <yesanishhere@gmail.com>
Cc: andersson@kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Nov 2024 at 17:47, anish kumar <yesanishhere@gmail.com> wrote:
>
> V6:
> divided the patches for each section as suggested by mathieu.
> First patch is updating introduction section
> second patch is for new overview section as suggested
> third patch is for devm version of rprod_add
>
> V5:
> based on comment from mathieu poirier, remove all files
> and combined that in the original file and as he adviced
> nothing with respect to old documentation was changed.
>
> V4:
> Fixed compilation errors and moved documentation to
> driver-api directory.
>
> V3:
> Seperated out the patches further to make the intention
> clear for each patch.
>
> V2:
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410161444.jOKMsoGS-lkp@intel.com/
>
> Hi Mathieu,
>
> Hopefully this time around, I have not messed up
> patches. I have created three patches.

And the patchset version?

> Thanks,
> anish

