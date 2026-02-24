Return-Path: <linux-remoteproc+bounces-6580-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE6SMYIgnmm/TgQAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6580-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Feb 2026 23:04:50 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E3918D044
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Feb 2026 23:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68C913083000
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Feb 2026 22:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1554D33A6F6;
	Tue, 24 Feb 2026 22:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="D6NoCgJG"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FF933C52A
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 22:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771970662; cv=none; b=abuowCc0V+0Fe8qAyFeT39j8Dh7+au3NXaugR+iE3+pAJr28U7q4bdPgPwPQAbbOOjxLuNLOVgyETQxVU6rzn59N2J+01vZBT5InnpPhx+VduFWHWHKDFSiz7dU8Mruyac5Tw73CQYWWB5m18WLNUGsnxJIvo6Ct52Nx53cCABk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771970662; c=relaxed/simple;
	bh=tRPIeF3USaGz/Rg1sq6D9L5GyF5PRmv+ItkFaRfoVCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=swUxLuTrbaouwQWr75qK2ygiU55w37p+A4AfFbzheqH6pjrPxBTGXAXUT7CDwPIDcIssWheFj+rWhMVe+QqLumpx1iqHMLfpU/jYkN54ZwNfY4fnLC3hDIBvhodKiN2J3jgmjPqpQhGwngZ9gj6xX5bhjTVaJ+y4C/Uv4djDyE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=D6NoCgJG; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2aaed195901so28483065ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 14:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771970660; x=1772575460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsC7AKbjiTHPqzp/xUgXJQ7GQr44d/IFVx1SjO2ugwM=;
        b=AEpJO36s0Gv4IpT9jCAOAF7y+jgseFexXNMEIziCE7fg9gOKE3ACtj1EoBopM/e8rY
         25WU7gD4CFoBNkNiQmnYNR0A1Ud2XMevarQZGCNirawV40uLxSwYnKhLwePFwHP+XAmA
         tryycr0a4A+ZJR95fcnkFeEJWi+gE2yqeEcxNeemta7ZvWkvnv+KHy8kNanw0ajGUR9I
         AYdJ1GcMuu2wYMI2/160MQFXjLbumXVDgBysvcC23ExSSOL7FOB//2kX1e2GKODUMsjT
         kv1qu99DCNDVy54wVsz87UO9KttbqAh6d2UReePYik12PSQWmC7+0ztKwaDJhphWnEYM
         4fkw==
X-Forwarded-Encrypted: i=1; AJvYcCW4Bi8lPh14l3km1qlGBfpg0fqBVLFJGRL94fuNHuFLLrIT3i7R/RPiziNgJOgycBoyQzxxPnnoE5GjqVZ07/at@vger.kernel.org
X-Gm-Message-State: AOJu0YwQZoQ819OE4T2G0Ok+Wk/wA/E/EFIgNCtHRlngUEI8MFa6wNsB
	yecy5tqNZ6LZqSy2sDpWCpKUWM+hNaaZjUbUF90JTozPKBj5HgK4VYnUL5zNwGTbRPS4HrfsQlp
	AXaSet1HXhxJLx7uZqczDmBQ7alZTad8+JU9zmGgbB6pMQkfJnilF1rl5l/bUES18WPFxQMxl1D
	19+J/v4MlBnfCqHEby8QbVnTDLRUT/+s4Rr+eh9u/IcPxhL9e/IHdlgjZ2me2V0vqv1S6GAidSe
	5MFWgC0TROffiJNTY5eCw==
X-Gm-Gg: ATEYQzxBSJiqK6gQ3cU1w0zFe5oJEVVEAZFShA6fEtDrXHGIGTeF/oKKFpeakQoagCn
	stz1vhCvHIsboLETeFxdQHwlL+xgFazBIGkRIw+8rlOJJ+r2vzYnetW4z++LQuJNR1lZXIeK8e7
	7C9h54nY5V6F2Rd4TCCETcC4/xt07vAB/1M2rd3slodIHQ+i39DlTRa2YbrhMITmYO25scJDXUH
	NtQaAqI7Vp8EFKKJBZPacUa66GTM/ZqwE2qG9qPJvKPS7N+lEA8Zv/IXgUgKculBtmiSQuGnG2L
	eyE3Kh/Jffl8QAEU5oAsinZSSiI3XjZgxBaEpsZEfIgtcmFttEAOHFd5vYJIcx2Q2wW+Mzn1/kL
	UBuk3jgVsGhpw+96HFe5EDuxIlG/hwEI+2mhSBbfBZzHGLRuZxyMudNKJfF99YRq5YP3oDPqgjV
	Y5hSJwIiu+O1YMcgweJHYVeCd9GwiK1k2rgd7A7Gqeiq/5FPdeduhz6tUw
X-Received: by 2002:a17:903:2a90:b0:2a9:30d4:2b0c with SMTP id d9443c01a7336-2ad74562045mr130366995ad.46.1771970660121;
        Tue, 24 Feb 2026 14:04:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ad74e039e7sm13379495ad.1.2026.02.24.14.04.19
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Feb 2026 14:04:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba9f033a5bso53592909eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 14:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771970658; x=1772575458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsC7AKbjiTHPqzp/xUgXJQ7GQr44d/IFVx1SjO2ugwM=;
        b=D6NoCgJGXX80rK8yw+3pQRllJLR1Y9K3OuzJoEq22Uzt7cLlkGsLq8aZ2L2vZDN9TB
         acHbcnqqtlyi0TYbhnwSINBUVvU3SsGbF5KCgkjpjMDilS6or/Dh8/J/SkKjsd1psZk2
         i08Ns/eIyh5+GXWVGlouvRCWEyEH2DaRq2hy8=
X-Forwarded-Encrypted: i=1; AJvYcCUclpE1noUJ7G4HDc6cgQcDDbSB+YXmFqIPXco1HX3Lp8oqdt7kD2UDHAPa+ImIw+1nRQ9TK78TU6T5wTOTZerm@vger.kernel.org
X-Received: by 2002:a05:7300:134a:b0:2b8:26b8:3444 with SMTP id 5a478bee46e88-2bd7bd3b218mr6137891eec.19.1771970658211;
        Tue, 24 Feb 2026 14:04:18 -0800 (PST)
X-Received: by 2002:a05:7300:134a:b0:2b8:26b8:3444 with SMTP id 5a478bee46e88-2bd7bd3b218mr6137863eec.19.1771970657544;
        Tue, 24 Feb 2026 14:04:17 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdb055507bsm2374822eec.0.2026.02.24.14.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:04:17 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v6 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
Date: Tue, 24 Feb 2026 17:04:05 -0500
Message-Id: <20260224220407.2351692-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
References: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6580-lists,linux-remoteproc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.dasu@broadcom.com,linux-remoteproc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	DBL_PROHIBIT(0.00)[0.6.42.70:email];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:mid,broadcom.com:dkim,broadcom.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-remoteproc,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29E3918D044
X-Rspamd-Action: no action

The Broadcom settop SoCs have hardware semaphores as part of the
"sundry" IP block which has other controls that do not belong anywhere
else e.g. pin/mux controls, SoC identification, drive strength, reset
controls, and other misc bits are part of this block.

Adding brcmstb-hwspinlock bindings which allows the hwspinlock driver
to iomap only the 16 hardware semaphore registers that are part of all
settop SoCs. The semaphore registers are based on the BCM7038 SoC
where they were first introduced in settop chips.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml b/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
new file mode 100644
index 000000000000..0d8c5b8219e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Settop Sundry Block Hardware Semaphore
+
+description:
+  Broadcom settop SoCs contain 16 hardware semaphore registers
+  (SEMAPHORE_0 through SEMAPHORE_15) that provide hardware-arbitrated
+  mutual exclusion between drivers running on the SoC.
+
+  The semaphore registers belong to the sundry hardware block. The
+  node describes the semaphore register range carved out of the larger
+  sundry block address space.
+
+maintainers:
+  - Kamal Dasu <kamal.dasu@broadcom.com>
+
+properties:
+  compatible:
+    const: brcm,bcm7038-sun-top-ctrl-semaphore
+
+  "#hwlock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#hwlock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    hwlock@404038 {
+        compatible = "brcm,bcm7038-sun-top-ctrl-semaphore";
+        reg = <0x404038 0x40>;
+        #hwlock-cells = <1>;
+    };
+
-- 
2.34.1


