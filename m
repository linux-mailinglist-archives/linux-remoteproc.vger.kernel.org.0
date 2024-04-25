Return-Path: <linux-remoteproc+bounces-1211-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C268B1B7C
	for <lists+linux-remoteproc@lfdr.de>; Thu, 25 Apr 2024 09:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE8F6B2468B
	for <lists+linux-remoteproc@lfdr.de>; Thu, 25 Apr 2024 07:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2516996A;
	Thu, 25 Apr 2024 07:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="nVQ38dFz"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE1917E
	for <linux-remoteproc@vger.kernel.org>; Thu, 25 Apr 2024 07:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714028935; cv=none; b=jzQ5LjqKd+HYXMBeqDy8HGSTuMH4MVcSo1YduRDkcYaNatQkBqyc3wuFG4GP5USJY2lDM6labvUe9uUNyXAG85TQfBdIHKfMee8Ego5a5k4MFKn70xY2yLauepUwwsm/e6EHrZdQO/Lhvh/qnYLMl3XU70Mztn6hpCk8f4GcZ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714028935; c=relaxed/simple;
	bh=dxvcnWv0WL6fnGVl4pD57GYjSXjYORVODH1fVkqG1pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QsWTlVDirU61oT5Jgb8rAgsDfuO7Yj76EjtPG2A5sJObTzDOY4YP0LQKFOC8bQOaHq6I6ARbDoDUNXM1YGV/3jCGTN9eim76/5Y6hmvAh/7tUpBOaDjnpvuxXFBjavrgPy7Pp7NH8n/F3ffOEQR0US6lG1jeAV7kfl1yjVfBazY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=nVQ38dFz; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e47843cc7so473663a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Apr 2024 00:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1714028931; x=1714633731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZ8UHENlPhIQYeuk20DZOkVBhsN1B3B5WhnRPOwIkv8=;
        b=nVQ38dFz9yBAFpgQuljmGP3syVPHAM3BmQ8I7oX0gV7h346KLeAbyVUO+RyfUTTkfv
         Pddwxj0e3xD2SuRbV0hcH3NjW3vlQK4tz1Pylj0cH7EdzQ7f5JwlltMxWupZE/pO5VZc
         yopftxTfqVCYOa1BWnsUdgNUEhpZUWcHutOvgk1G3IqGuG88QnxMAhDeX+oBlMxBKI9c
         FupwWs4RhydBBAqIr+qWCRPkCAhgO9B3F/YHgkw8fcuUSX/3HJjjBRt+dNSeLFjljNvR
         +KYcgq7Y65h95sCZGjk5d0AcS26ISeMwMtz4mtAqtLz8rWnUpBBqNv09Ab+adHjaow3Y
         YIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714028931; x=1714633731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZ8UHENlPhIQYeuk20DZOkVBhsN1B3B5WhnRPOwIkv8=;
        b=cUTGxPvtQYckFat4eT75JttVruhiLdxYFaz483uTlgOopiPrNc0GcpQcUuBwU/wXa5
         T1R2POaXB8LN3vh3MHeb2TtaW6pnvM1jJU92afnxeVErzeRdoDIwlBXKd7THjlKb0ok2
         hSc8+pUHEjOsp9uzy5OZTDfXqGFjrF6xccjy71AUfv//fXwDyt6m+T6Sl4vV2bRxKz3I
         HCLGp1TtO0u+an3AETnShII1M5OfymYzuDD3gc2vmek2JIom4Pa/l4FJXgolufpMKKTa
         BK8DG7pVuJZsbNW8U3RgmiG7RMPR3YVyoK19AcahDEs9UiRyBQAUt0dcSJPfr8wQypiG
         bPFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO1yGMud8pQxp2oY0LAdPtjxJYW3wZc6UGy1MC9f+pWOYkDVDpYDLV+xTgslPqGXUEVODvJCJtcqEjYzXycjdDSFWpm/IngfpoRXq5HERs9A==
X-Gm-Message-State: AOJu0YzBNC3N/uqxNNbxZo7QmuKTkEraAJhNQZcUEwd0HxNtaWUIo57S
	jbnVPyKkwxGYY+eOgf/T5ZVdj3Oqq64fSHm+EKoQqMsH1U86cAXjzVrgjKIOPkJMbrwou+4AF1q
	QV+5BxX8lEXbE3od5ocGtf1kWn7vjyapBHWphRg==
X-Google-Smtp-Source: AGHT+IEfYG2BOLw4UWAEzb26S03pLrdQo+lua1THVrfltSNEkBg4UOKp//fNn/nEfyCZLTOooJBrKne8IB7XM3ozenw=
X-Received: by 2002:a50:a445:0:b0:56c:5a7b:5dbd with SMTP id
 v5-20020a50a445000000b0056c5a7b5dbdmr2997625edb.15.1714028931287; Thu, 25 Apr
 2024 00:08:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
In-Reply-To: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Thu, 25 Apr 2024 02:08:39 -0500
Message-ID: <CAKXuJqi4GS5T9JXuo39Zyma-2jSc1-rW9mg=nDQRSyB=ni9-1Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] soc: qcom: add in-kernel pd-mapper implementation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Xilin Wu <wuxilin123@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Wed, Apr 24, 2024 at 4:28=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Protection domain mapper is a QMI service providing mapping between
> 'protection domains' and services supported / allowed in these domains.
> For example such mapping is required for loading of the WiFi firmware or
> for properly starting up the UCSI / altmode / battery manager support.
>
> The existing userspace implementation has several issue. It doesn't play
> well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
> firmware location is changed (or if the firmware was not available at
> the time pd-mapper was started but the corresponding directory is
> mounted later), etc.
>
> However this configuration is largely static and common between
> different platforms. Provide in-kernel service implementing static
> per-platform data.
>
> Unlike previous revisions of the patchset, this iteration uses static
> configuration per platform, rather than building it dynamically from the
> list of DSPs being started.
>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> To: Sibi Sankar <quic_sibis@quicinc.com>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Cc: Xilin Wu <wuxilin123@gmail.com>
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> --
>
> Changes in v7:
> - Fixed modular build (Steev)
> - Link to v6: https://lore.kernel.org/r/20240422-qcom-pd-mapper-v6-0-f969=
57d01207@linaro.org
>
> Changes in v6:
> - Reworked mutex to fix lockdep issue on deregistration
> - Fixed dependencies between PD-mapper and remoteproc to fix modular
>   builds (Krzysztof)
> - Added EXPORT_SYMBOL_GPL to fix modular builds (Krzysztof)
> - Fixed kerneldocs (Krzysztof)
> - Removed extra pr_debug messages (Krzysztof)
> - Fixed wcss build (Krzysztof)
> - Added platforms which do not require protection domain mapping to
>   silence the notice on those platforms
> - Link to v5: https://lore.kernel.org/r/20240419-qcom-pd-mapper-v5-0-e35b=
6f847e99@linaro.org
>
> Changes in v5:
> - pdr: drop lock in pdr_register_listener, list_lock is already held (Chr=
is Lew)
> - pd_mapper: reworked to provide static configuration per platform
>   (Bjorn)
> - Link to v4: https://lore.kernel.org/r/20240311-qcom-pd-mapper-v4-0-2467=
9cca5c24@linaro.org
>
> Changes in v4:
> - Fixed missing chunk, reenabled kfree in qmi_del_server (Konrad)
> - Added configuration for sm6350 (Thanks to Luca)
> - Removed RFC tag (Konrad)
> - Link to v3: https://lore.kernel.org/r/20240304-qcom-pd-mapper-v3-0-6858=
fa1ac1c8@linaro.org
>
> Changes in RFC v3:
> - Send start / stop notifications when PD-mapper domain list is changed
> - Reworked the way PD-mapper treats protection domains, register all of
>   them in a single batch
> - Added SC7180 domains configuration based on TCL Book 14 GO
> - Link to v2: https://lore.kernel.org/r/20240301-qcom-pd-mapper-v2-0-5d12=
a081d9d1@linaro.org
>
> Changes in RFC v2:
> - Swapped num_domains / domains (Konrad)
> - Fixed an issue with battery not working on sc8280xp
> - Added missing configuration for QCS404
>
> ---
> Dmitry Baryshkov (6):
>       soc: qcom: pdr: protect locator_addr with the main mutex
>       soc: qcom: pdr: fix parsing of domains lists
>       soc: qcom: pdr: extract PDR message marshalling data
>       soc: qcom: qmi: add a way to remove running service
>       soc: qcom: add pd-mapper implementation
>       remoteproc: qcom: enable in-kernel PD mapper
>
>  drivers/remoteproc/Kconfig          |   4 +
>  drivers/remoteproc/qcom_q6v5_adsp.c |  11 +-
>  drivers/remoteproc/qcom_q6v5_mss.c  |  10 +-
>  drivers/remoteproc/qcom_q6v5_pas.c  |  12 +-
>  drivers/remoteproc/qcom_q6v5_wcss.c |  12 +-
>  drivers/soc/qcom/Kconfig            |  14 +
>  drivers/soc/qcom/Makefile           |   2 +
>  drivers/soc/qcom/pdr_interface.c    |   6 +-
>  drivers/soc/qcom/pdr_internal.h     | 318 ++---------------
>  drivers/soc/qcom/qcom_pd_mapper.c   | 656 ++++++++++++++++++++++++++++++=
++++++
>  drivers/soc/qcom/qcom_pdr_msg.c     | 353 +++++++++++++++++++
>  drivers/soc/qcom/qmi_interface.c    |  67 ++++
>  include/linux/soc/qcom/pd_mapper.h  |  28 ++
>  include/linux/soc/qcom/qmi.h        |   2 +
>  14 files changed, 1193 insertions(+), 302 deletions(-)
> ---
> base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
> change-id: 20240301-qcom-pd-mapper-e12d622d4ad0
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
I've tested this series over a large number of reboots, and the p-d
devices(?) do always seem to come up (with the pd-mapper service
disabled) on my Thinkpad X13s.  One less service to run in userland!
Tested-by: Steev Klimaszewski <steev@kali.org>

