Return-Path: <linux-remoteproc+bounces-7480-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIr2GvXD72lsFwEAu9opvQ
	(envelope-from <linux-remoteproc+bounces-7480-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Mon, 27 Apr 2026 22:15:49 +0200
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB79479D1D
	for <lists+linux-remoteproc@lfdr.de>; Mon, 27 Apr 2026 22:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1769430B7496
	for <lists+linux-remoteproc@lfdr.de>; Mon, 27 Apr 2026 20:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35ED3318BA7;
	Mon, 27 Apr 2026 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LTzf0Djn"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7666F31E83B
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 20:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320777; cv=none; b=OWXyc9oNNM/F74RCoB/m67gkInMnVyYA7ObR8UUIJchgJKexp6GfMMtuZXAMtVhX4laWArnBhwxcMgj12jTT2pIo7CCXXK4Dw9VIUKpKrdtW6YQjUN2RihQwrnjFB+Ts+wE+/VAIQEmIJrn0D1OT66tzZHHMQGUcz99agUm/6IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320777; c=relaxed/simple;
	bh=mBAgnSsUNn3fsc8pfQtWtaiDDL5qRMehlyaAO/YC9RA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bIE5BVbCMAMHcEJ0sRhTrmcFWDJWvhYtwyu3tk3Np6SvIOM0JOmvSSpBjnDXidO+kUU7obKJZsG72Kt+cWbgqKv5BnRV3GkjZCIF05iROyjdMK0E9mODsgqRGQSLmmqpWMvjSSxjGATtMT7rV8ipI03JTHrMHZpFTC2v+fwfOOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LTzf0Djn; arc=none smtp.client-ip=209.85.222.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-8ee7ffd738dso720760885a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 13:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320774; x=1777925574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6HrkrEMv+Q+KsECCy2j5IGNVAW2RVCs/l06xUaahDY=;
        b=bDyFb0zCpmlnMRan+J1k+RtyairER7cu+5tEyW58qj/VcR92lrqfst9ktQ7E9CYYEB
         A7i/uGOWjKX/GyKKkBjjW2aKS/AnMomBRWmxKBQInMBXDY2Q5du/jHbkl4KmnT/GnZDq
         dc5UA1AotEOm5SLjEM2bpCXsFTBZ+kMcZFTxxS9rZ2SCC6X1i/4Cm/HcmKMi7yJOaQls
         wQZGDJdeq/lK+sIj6fKSymiuBbGdGN55YjSS+xMenNOrS4zIYHP8dTK7sl5U6j/KTG3k
         i95PbOZ15s3Bns429QpvyFy6IPxDqkgTzgZ+qyMIuRzxq+3+SCIRCUpi26NblpLNwLPn
         DJ/w==
X-Forwarded-Encrypted: i=1; AFNElJ+pbO1wUcg4stAbkdWJSrVkU913UP9RlIzQcy+iSDl8m9GNe0TjL6yq/bAIdvWMFSibno5I0Ycba7cluxp8kxL5@vger.kernel.org
X-Gm-Message-State: AOJu0YzxzNRa/acdG7PRuEaDYccSpBoP0HBDtwRRnL0smuV8Y0gKiBnj
	TpDw4jgDkzyg7RLX69WvWSnRwAq8iuo2K60jeVCX5UBoRsIkxtuQxCnJaps/AaozW5sRXdTanvX
	UspYxFHhII46Be6TjYYRu08U2lw1TzsI3MFRkYuY00rPGQgIq2P7lZ3ON4KvxQaiBTbcQgIoq3R
	vSjRxiwacZTmw5nwkmoC5krJRTY6XORYeKqD1Tp8k7s6Zr8MNMWuX6xOYo1lFIv/9RoQHxj55hi
	LJKg291Qkv+OlcLdAoOnA==
X-Gm-Gg: AeBDietY14kc2jS4htEJwFjhkUpBcKYwbqr/UwSXMcLyP48yGEuJKKJKWQMWuuNEqyS
	p0/yHXapCQ8W759ZSMmACdUZc2egmykkFGeEpBD3W5JKAdwak9bXOnMHhcUOWF0YucESSu+nYDB
	Gm4TP99cvVJyWDo4ilbA9hAsSpEZlgP7572O9n1ROj3M5T6n2fF8je9gycIyy/vkU4RrvH+HOIl
	wuEx8ss89XgHDtwf3ag39Oc+9wW5OoQ9JprorSnRJy/PIPQnBDm3H7L/iDm40McoHy+1Iar0B4L
	e1xmRVttZbeRIEbQcqN1oxnHaa1NyvM2ktgBuWx3zsZZSdBGedmI+LdCDy46zNxz8SoeqiBl2/l
	k82/4psXHM3ETF8fgOMBAJB+qkogz9wTDQAaXTIlmohTHF7VN7EMutqFaMJdM73UGuBGaD6mugi
	1OniOyn8kO/JfW
X-Received: by 2002:a05:622a:9017:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-5100d9b1c90mr3470161cf.5.1777320774018;
        Mon, 27 Apr 2026 13:12:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-5100da56d16sm85711cf.9.2026.04.27.13.12.53
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2026 13:12:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so6690930eec.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 13:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777320773; x=1777925573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6HrkrEMv+Q+KsECCy2j5IGNVAW2RVCs/l06xUaahDY=;
        b=LTzf0DjnQdOVs+eFKAdGOQJcbwVDQS+sxGHPI8lkzd3/2rMk8STdgrFFl+PXAe3wCy
         KJ5b/laJdCNnJksgRRfuNe3z0Mj1pScS83IjaNMvTMVPKqCID3TrtrwBKyj27fCRM2gm
         o1dlIk4izQUSPOVPTBKExYAOy9M5vW+RWn728=
X-Forwarded-Encrypted: i=1; AFNElJ+wuenU5/ydFQX6pwiFhukR2X1rJPqPuJYeVvsOFQMXBT06QBKC/1QzYzoix5Kq8Dao0bsovTITia7avDU4GIcg@vger.kernel.org
X-Received: by 2002:a05:7300:dc85:b0:2c0:df3b:ec1e with SMTP id 5a478bee46e88-2ed0a530457mr90791eec.11.1777320772615;
        Mon, 27 Apr 2026 13:12:52 -0700 (PDT)
X-Received: by 2002:a05:7300:dc85:b0:2c0:df3b:ec1e with SMTP id 5a478bee46e88-2ed0a530457mr90770eec.11.1777320772079;
        Mon, 27 Apr 2026 13:12:52 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09fb6b7fsm437136eec.10.2026.04.27.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:12:51 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v7 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Mon, 27 Apr 2026 16:12:33 -0400
Message-Id: <20260427201233.380314-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427201233.380314-1-kamal.dasu@broadcom.com>
References: <20260427201233.380314-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Rspamd-Queue-Id: 0BB79479D1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7480-lists,linux-remoteproc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.dasu@broadcom.com,linux-remoteproc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,broadcom.com:dkim,broadcom.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-remoteproc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Adding myself to the maintainers list for the hwspinlock
driver on broadcom settop platforms.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..4f3dfc6a090c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5244,6 +5244,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
 F:	drivers/gpio/gpio-brcmstb.c
 
+BROADCOM BRCMSTB HWSPINLOCK DRIVER
+M:	Kamal Dasu <kamal.dasu@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
+L:	linux-remoteproc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
+F:	drivers/hwspinlock/brcmstb_hwspinlock.c
+
 BROADCOM BRCMSTB I2C DRIVER
 M:	Kamal Dasu <kamal.dasu@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
-- 
2.34.1


