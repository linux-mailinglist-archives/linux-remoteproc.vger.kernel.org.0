Return-Path: <linux-remoteproc+bounces-7400-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFtDDGTb6GnOQwIAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7400-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Apr 2026 16:29:56 +0200
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE4044740B
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Apr 2026 16:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43B94305E9C5
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Apr 2026 14:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA6F2147E5;
	Wed, 22 Apr 2026 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="an6Geg/h"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500BF28A1E6
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776867893; cv=none; b=IYeN1cs6eigluilJddfiHhTfIxsmjSKHdtUIRTk+h19JMm8e5chKdh4SSoNOuQEDpc3LLmPjAME1WwG2GazlKUdbtupxrKYt9lRrCk6KCRhToSzcRdaSuaJ3xXswKRLNCNnW/d8ub9fguYkwQn1COyTYIOq/kfox18gecicaSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776867893; c=relaxed/simple;
	bh=zMUnnTBzwK6mlfcfjhSFZ71/QbTfsBbb9id1Nfcq/f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6Wpsx+aiDjfo7klhoM0k2Y9hjqocEcqz5tlbQ3bUu9/tumlArxGPAnlo3JmDfxS/5ToTjup5Kr+WB9hqsguq3b5obp2QljjwG+7shJey7sc7N2S62pZECUwswwpZ4K5ClQKDM4kj8LdHuFl48Bu2JiPzRP8QNRlfwRT+Of7GzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=an6Geg/h; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f6b592fc7so2549728b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 07:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776867892; x=1777472692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JpYE+6IxXCkaQ1dQEkk9XcGyhE9j8C7jivwDbNtlpmY=;
        b=an6Geg/hFHN2cv5pTfhauQEN1sCIF4jkyp99CB8zdYcZvci6fkotgsBKGtkosivWd0
         3LeNOhwmBsvExBg4JbOPUCP00oI6yJT4eWaRm7s8guUALeQ4G336S7ZT/hQJmxOE5Oqk
         oyYZr+xOxkDk3fiAv4JnZXjpbTXWCYvXXtZ67JvCs1c1ARVZnNkzV/3e02tQ+bcg6ZEI
         8Yqq1JNfuCu3QTbM4E3WjVRRnJP94CmwvN0Gl/BnXmSPvGwqZWPeFabzdiEfXYAjIjBI
         Q7RoJ5LF8bVo0HngsYacJ1Es7tnb5DuWhEgvaBd173tOWRY0NfNqgjFplLImAwnShaWY
         +OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776867892; x=1777472692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpYE+6IxXCkaQ1dQEkk9XcGyhE9j8C7jivwDbNtlpmY=;
        b=pBG1f41hqxcb7KXH3FFs9pv52HpNhM8PWrVSaHtueHhYhVzATgsv2btmr5mOc3qUCd
         g5r0OBFFqxNtEZLkCLm2Qyy/F1nh8BoftUG1NeV7E6J1MB7RelOcD8QBDppKEemHqh7s
         57IiOmAY73NB+XTauRc8/6p+K3de1/cURXI+v6OgcoJ5I50d6BA8Ci2LnUa5Lk5zRHcb
         3yws3yqQubmOtJ2o9KFs9JdFRd6IrvLve5J4auC1zUo4mBtrX8rTCLmtbfgZDfRuN0wL
         yPNDemu+3ShMMxBLlhW4PrdHCF8Eugg7hn7CC64UCLyEntet7W63FLvRe254ugfZ4BnO
         8CWg==
X-Forwarded-Encrypted: i=1; AFNElJ9gYdSSL1P/obyNGDMdCOOqiK6zDL9kWnDyIXzG9bghGGqH+bg1nn8bETRFUILIolHE+IceEmm0dI5KMSrZydoW@vger.kernel.org
X-Gm-Message-State: AOJu0YwHiScLLFAp/rV+V5ewwgo12xsZ2KujTU1ELva0evDOPOwEe90M
	AHcmYYAr4WQdZvxxGhYEvwLZ80jbteBzTXdEmRGbhKUPhYOWvsFCAoLF58KKxW/cx7s=
X-Gm-Gg: AeBDiesMEwzHbf0aqrCWIY6xREngwSLqr01hJ5ELTg4473v6OkyLYzvLWIuy2PlYJgn
	uaf+ZdTqd9X8OImJ0DPVymFvLoWmeuGfXHwYQBV5nceUayHa3sVG4WIVX/eXhi0KyGQCj/b0mlm
	8L7SqirNgZuqJifXDfSi5VSa56ENRjQwYP0tCM5Si9JSbCUEvfpVqlANHBmG0RMe+F8u/naSCpb
	Ln2JkEP0RqWpHJcKKue0SuJ5scNaJ6QVJSCPgbsZvW3wHC+s+EFNVRYWcCUqllGV4cimzLCDUtC
	wmg7Ai40jsAAWe50xPwGZa7KSzt/C3h/2vMLnaZCljspTrXUjRBaSoXFf2rL+tyzb/OUtphf9/e
	noeIkzJJ6xevxXBnBq5fj9QK1AQOJg/uaP3xU16WCRyLD8U1zntqOw/BLtnqbWEBLhpnljRosTv
	Lb9hv4eXDL9lZhSLPRFurBgv/pCwKgf5bbtsBx9A==
X-Received: by 2002:a05:6a00:27a8:b0:82f:18fa:1668 with SMTP id d2e1a72fcca58-82f8c91e3cbmr21870805b3a.44.1776867891397;
        Wed, 22 Apr 2026 07:24:51 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fd65:9224:aee7:cdd9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm18124769b3a.56.2026.04.22.07.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 07:24:50 -0700 (PDT)
Date: Wed, 22 Apr 2026 08:24:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: andersson@kernel.org, fabien.dessenne@st.com, ludovic.barre@st.com,
	loic.pallardy@st.com, arnaud.pouliquen@st.com,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: dead code cleanup in Kconfig for
 STM32_RPROC
Message-ID: <aejaMFEc6WRJY_hg@p14s>
References: <20260417221337.286313-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417221337.286313-1-julianbraha@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7400-lists,linux-remoteproc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-remoteproc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-remoteproc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim]
X-Rspamd-Queue-Id: 9EE4044740B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 11:13:37PM +0100, Julian Braha wrote:
> There is already an 'if REMOTEPROC' condition wrapping this config option,
> making the 'depends on REMOTEPROC' statement a duplicate dependency
> (dead code).
> 
> I propose leaving the outer 'if REMOTEPROC...endif' and removing the
> individual 'depends on REMOTEPROC' statement.
> 
> This dead code was found by kconfirm, a static analysis tool for Kconfig.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
> v2: fix typo in commit message
> Link to v1: https://lore.kernel.org/all/20260330224545.29769-1-julianbraha@gmail.com/
> ---
>  drivers/remoteproc/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>

I have picked-up this patch.  It will show up in rproc-next when 7.1-rc1 is
released next week.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index ee54436fea5a..c78e431b7b2d 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -316,7 +316,6 @@ config ST_SLIM_REMOTEPROC
>  config STM32_RPROC
>  	tristate "STM32 remoteproc support"
>  	depends on ARCH_STM32 || COMPILE_TEST
> -	depends on REMOTEPROC
>  	select MAILBOX
>  	help
>  	  Say y here to support STM32 MCU processors via the
> -- 
> 2.53.0
> 

