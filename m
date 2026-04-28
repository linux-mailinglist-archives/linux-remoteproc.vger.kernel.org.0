Return-Path: <linux-remoteproc+bounces-7508-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPwcC3Lq8Gn2awEAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7508-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Tue, 28 Apr 2026 19:12:18 +0200
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A54489AF4
	for <lists+linux-remoteproc@lfdr.de>; Tue, 28 Apr 2026 19:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 055AC31C851C
	for <lists+linux-remoteproc@lfdr.de>; Tue, 28 Apr 2026 16:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B06334C1F;
	Tue, 28 Apr 2026 16:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="XfiIGnuM"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E45732E75A
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Apr 2026 16:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394853; cv=none; b=eV2Js2xSMjlpxFOS41vmTzFAHTlRQUulCwyjo0e5gPTrLrF6+ike0R4gec9szO8OZVZOEpazFmp/nXlbER3dIghyGX4sfFs22632/8y7xfB/pJrmMjKK5uWXnkrBwjEntNpzqWAl7hjk6AvuZc/rh5Loa2uwTNS1udBN14hJCRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394853; c=relaxed/simple;
	bh=9S9GoA2wdMOKBwQUq6uU4RsjDD9B9w9gbFBChUNcp5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJnZlt9NOyXffvP78fRQ38ezUiTU1azCqEY7d9Y6a0YW+qZBUgSel//Vh96QQ5tlxS79q+0tKHpk34Ttgkmh1wE9+gxLzt59ge8V1D6c3Ql57kZrFZw9LgL+h0wu3c2ZO6pZF83GHKjBgJjK0R26KLVwOPHWZrIBmJVWHp39WQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=XfiIGnuM; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-415c8a4d2e6so4616823fac.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Apr 2026 09:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1777394849; x=1777999649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsaS50fJFWEgKS/X3mmwXYg/L5d5/h6qIX6nFemmP8U=;
        b=XfiIGnuMwfnSZxVU2xMgiQkpcZx9aOzJFtBz/g7B0AIMVtPkX6kMu59YPBadlEyBuM
         FQF2p+kRwFoecg5nfEGOocMnL5tUqrba1mQGA9Vfuqpjh/BsagGOYnQzCwHt7+h5XFOb
         xfmVVCQ4cXKEpESLS4Di0RDcO629CVyZPLD6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394849; x=1777999649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsaS50fJFWEgKS/X3mmwXYg/L5d5/h6qIX6nFemmP8U=;
        b=jLsbDzCc1cIz9vOmMlPNwSw1FLxXfl8Ryv/ZQlbMH6uisPs1yVYm5WKQd1dLpl41vL
         UU/mEzk+YoVZ//JCVBchdYw4TKBXQtqnarHziodZkBoaVt6C7xYOMafmVQ5enGO+eGz4
         fDYzYefQc+r2U9FjPjqQPdAA7ZMWLp9OAB8iEJMpYMpQ9W9TT/CnndRbkzqWm4Y+uoiS
         kqVhLrRfoZVH22KGXt8lmxwsmtiEPC9pABrJ3+Oy151wCFYchmxtWqwsXJEo+NAfmVQK
         w3eeTMcNO/dNmZp22lZ9hCJkdToamGs17YeicAS6SSwBWGawPX5dyiGqdbUWQqiVyjhs
         tM9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/HwqeHeEp59V5ZkBzFQPLko1ZMz0YcKEUmBOz4AIv2GoLV+I33z+qKBQ8oDawTA3swdIER+iegAvABtiWlKXf0@vger.kernel.org
X-Gm-Message-State: AOJu0YwkcHAls+FCO/ACuAHFDNrD6KVGJxSi47sALLcpE0yzBc4TJf9F
	lTLiR7c0isZi9UIOeIO+zQBQKs7PsCsFHzxkSNS1v3BpcMTDJJauSn88tOZyvGv8fw==
X-Gm-Gg: AeBDieskjLoAs2+Al41NjqVKw3M99U2WJqRuT7uIHROIMcbtB7XnQxDGgxueWcENzKF
	bPnIMxKHGgRfIkZMraS8G6p1/Z+aPDCy5qFqchAzf763i98dY3TcZK7NsW6wQaIZqd9RtmoQ8XK
	Sp7ODWhtXm5SUWjt/s9qGEp/DqvWOdwaySG8hwJOoKEQ7GE4G1h3jBSVmAC8inm43xs1ir1DaDN
	3Ex4X3x8z4LhA8NQbJB8ZXjYD1Hsu7R1XUfFzceErCsOzhm+qOqPkGyxKWBlRLlvQE6TEmD1pbQ
	o+aK6s0n0mArfAd+jvMQZxe4N2Ha/lna2/oaYMszC3yNuAAO8M4cFR08kgmVw1wX1Ouod11YSNk
	rNBnOp8YRUpUTSsC646LWP6pla3dhv6R+ZVFKqguMGGe/O4a7WvZ1BmB6yAe4BVMcSVZ22vNxf8
	KXd9Tc5BiLQNrV9vc+CjaIXHM1smrK9FPdxGPXmod6Apc1RZBjvPNmk9YNzgC4mjGcfnsl
X-Received: by 2002:a05:6871:e78f:b0:42f:ba47:36f5 with SMTP id 586e51a60fabf-433f396963emr2135147fac.17.1777394849189;
        Tue, 28 Apr 2026 09:47:29 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-433efbf1d8dsm2255892fac.6.2026.04.28.09.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:47:28 -0700 (PDT)
Message-ID: <bf380b65-1513-4792-9e3c-d03bff17c141@ieee.org>
Date: Tue, 28 Apr 2026 11:47:26 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] net: ipa: Use the unified QMI service ID instead
 of defining it locally
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
 andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kees Cook <kees@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 32A54489AF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7508-lists,linux-remoteproc=lfdr.de];
	DKIM_TRACE(0.00)[ieee.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@ieee.org,linux-remoteproc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-remoteproc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:email,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On 3/16/26 12:14 PM, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Looks good!

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_qmi.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
> index d771f3a71f94..37936ad132a2 100644
> --- a/drivers/net/ipa/ipa_qmi.c
> +++ b/drivers/net/ipa/ipa_qmi.c
> @@ -66,11 +66,9 @@
>    *   determination of when things are "ready"
>    */
>   
> -#define IPA_HOST_SERVICE_SVC_ID		0x31
>   #define IPA_HOST_SVC_VERS		1
>   #define IPA_HOST_SERVICE_INS_ID		1
>   
> -#define IPA_MODEM_SERVICE_SVC_ID	0x31
>   #define IPA_MODEM_SERVICE_INS_ID	2
>   #define IPA_MODEM_SVC_VERS		1
>   
> @@ -484,7 +482,7 @@ int ipa_qmi_setup(struct ipa *ipa)
>   	if (ret)
>   		return ret;
>   
> -	ret = qmi_add_server(&ipa_qmi->server_handle, IPA_HOST_SERVICE_SVC_ID,
> +	ret = qmi_add_server(&ipa_qmi->server_handle, QMI_SERVICE_ID_IPA,
>   			     IPA_HOST_SVC_VERS, IPA_HOST_SERVICE_INS_ID);
>   	if (ret)
>   		goto err_server_handle_release;
> @@ -501,7 +499,7 @@ int ipa_qmi_setup(struct ipa *ipa)
>   	/* We need this ready before the service lookup is added */
>   	INIT_WORK(&ipa_qmi->init_driver_work, ipa_client_init_driver_work);
>   
> -	ret = qmi_add_lookup(&ipa_qmi->client_handle, IPA_MODEM_SERVICE_SVC_ID,
> +	ret = qmi_add_lookup(&ipa_qmi->client_handle, QMI_SERVICE_ID_IPA,
>   			     IPA_MODEM_SVC_VERS, IPA_MODEM_SERVICE_INS_ID);
>   	if (ret)
>   		goto err_client_handle_release;


