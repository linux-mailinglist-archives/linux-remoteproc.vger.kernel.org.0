Return-Path: <linux-remoteproc+bounces-6634-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDGXMLn7pmk7bgAAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6634-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Tue, 03 Mar 2026 16:18:17 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D771F25EC
	for <lists+linux-remoteproc@lfdr.de>; Tue, 03 Mar 2026 16:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2889E302B657
	for <lists+linux-remoteproc@lfdr.de>; Tue,  3 Mar 2026 15:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE110481249;
	Tue,  3 Mar 2026 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g7reTRUX"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6262A47DD40
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Mar 2026 15:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772550834; cv=none; b=pwSXjZOX5X1hmYzLc3uaUsDUfiHLuvCTvazhLkiKg54K6zmYlm8QHbEJS/usqZvF1pFNmu/Tj3VPbu93vgTQc1GBxky+76s1R4B2/Yoq1C9bIvrh4cfwpVD3MaMqpdD7UyCuOwRG0cEh88RxbGMzGwrc88zWVcezJhXJtmYWlfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772550834; c=relaxed/simple;
	bh=u51znr7imJISDF2aAPlKKydu7adw48rtitqrto52OU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gYYD/wooizK+1Q/swRwAYHWPkArYWDhtCtsJ6h4qPHY34j9lAGiOvLhixkFL3/7LBDk7cCTK9rKl1AYgpd0lE/nxS4Owna/mibQMZZp+XQwxyASlx0XLMKl9wkzUOA4p1LWZMM71yx6xWfAoSGNgvXAC8LO7bKAFAsM8YlwVgR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g7reTRUX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so65476565e9.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Mar 2026 07:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550832; x=1773155632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/1uzkb2dN7kd3Qkoeot6UDS00kHNcaUEjRCBygzqAo=;
        b=g7reTRUXrVtGMEYIzIvuONNXEXEVuLlkgjZwxTj9HBoYzvJSp/7XPT8BrZYEbMXao6
         VdIBVDsTgSVvAuW00lD2LYsSYbZXHvHRG5OM+50tK4WGKt3/I9HUA9Nn04nc4ZiDgO+6
         mwkKyTXDeBHeMrTAOQtmQI40xvPU8oR2mEonk1FoLb0Wl3fNCjvs+CmDawaHheCJ6e+G
         2+GEdnuUAY7D0Wl6he8SLX24QPtUnfmv/IxHPjnwNhJzAphKpcitqkwuoni5lXgXHSvn
         DO8tJ4D9vz7RMPvJ6JyPnK4MbgylQP8jQGUJqhnPjH8noUWb4H6vHhRRtNeZg04sRlT9
         AAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550832; x=1773155632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b/1uzkb2dN7kd3Qkoeot6UDS00kHNcaUEjRCBygzqAo=;
        b=UNBMkl5RFWOKni6vSNZWgI8klM0JVxA/U4AYmznDcp5fWFJMWuwZPYpJRYlUVgPA76
         BJfSubxJoF4sGBnPLMNCrFdoIH2cKzZYK4rw+9Pq82GqH8T8cIY/5NpA5wcrNZyLEVNe
         ObXEoxBWo5NtVQwnR+M6L3iwB10fVFDURCuGFLHr1HhcOote5pafCZSHWr0zyxGRdrCB
         HjvfJrZkzsau3lqbgQWLmFBrBflrfzupA+g8dpPf39QEcdYYSzuHbuA5jEEOb/+Vnbzg
         izNfMFJvwBsvYFvE66tpHJvaNzl+M5donH67MKq2MMiLItvIO57vllqMaJ/Eh2UQArB5
         6IdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXliyAro2ZXyH4cZHl8fMi7H1Jgs3N6FLSGcirzcsE5XtAJlZA6uquOsSGq3IYCiJqJcPH8ZI5fV6NBT4tZhIu4@vger.kernel.org
X-Gm-Message-State: AOJu0YyDLu4HchfmDyPq6tyYOATMnoaT1bf3wphN/QHGJmkfnP5+izU6
	zvIhb+9GRX8rg6f+4qcpIf5UcviRypdw/SmFHOElOtwkwQ7OcMpax6onFyTantbMr2/Dyj9F2VH
	S39Wp
X-Gm-Gg: ATEYQzyss/tdNrdAaEvVmG4qajIWZPIKnyY+vEOP+VvsElD3RmvSiTzD3b4lMGW8B96
	IGOT0xCGciCNWheaFwJrkEzH5Rx4ic49Q9Vr6gzIcM3Uaty+E0quMLxJ6lcqyyeOw44W8zoQyBS
	gO0wrom27rvA0C8o718I/JmZr4HCOP3uxf99lMaFeNoeHq4sIGgcJ69x3czcwUc2YEwAhdG/v5T
	L5ZiNOHrhYsczap3C7IU6fKnYEtf+bnAUYltNaxQiEVY2GwTbZyxFoU/aM1C0zJYOSCaOjWtkTC
	Fh1GA6pHh9+ajLFEC+55y9T3aR9Vp9xoilWkHI1CpBX07JWer4ttTHyyN+K1pG2mKyXgLi17gjH
	RokbGBrj/YWSekHfT98N24cfQDGI9CY+o37eXCV62n0C+zYh4GnxNy317p1PkGcA/TlddLCMuYa
	72SL0h5DldjevhJ6h1rA4G
X-Received: by 2002:a05:600c:c04b:10b0:483:79a6:e7e1 with SMTP id 5b1f17b1804b1-483c9ba7e28mr208421115e9.7.1772550831695;
        Tue, 03 Mar 2026 07:13:51 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48516f74a1dsm10512105e9.2.2026.03.03.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:51 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Mar 2026 16:12:59 +0100
Subject: [PATCH 1/6] dt-bindings: remoteproc: k3-r5f: Split up memory
 regions
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-1-12fe72bb40d2@baylibre.com>
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
In-Reply-To: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2494; i=msp@baylibre.com;
 h=from:subject:message-id; bh=u51znr7imJISDF2aAPlKKydu7adw48rtitqrto52OU0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlv/qNZCSmsZ19u8ro08pvk1aoWlxdk/vxRE+Hztc3H
 7llXn9k6yhlYRDjYpAVU2TpTAxN+y+/81jyomWbYeawMoEMYeDiFICJyFsy/HcxFJpW0HDvkyZH
 RE9cdNd1vZNZ9/c2/AiqFHzvdPud0hGG/4nvDyr+UfRbLNv0pW2/VLO77vxZe5yiJqyYfiXD16a
 7hwsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-Rspamd-Queue-Id: B8D771F25EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6634-lists,linux-remoteproc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[msp@baylibre.com,linux-remoteproc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-remoteproc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Action: no action

Split up the region reserved for the firmware image in more specific
sections to expose the full fixed layout. Especially the LPM metadata
section is important for bootloaders as it contains information about
how to exit IO+DDR. This is read by the bootloader but is written by the
firmware.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml           | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index a927551356e69d3961b3c5c6b72d027fabe83d3c..6aadc61e20f9f4c27f5b9c87ab2025a02776c5de 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -158,12 +158,28 @@ patternProperties:
           defined. The reserved memory nodes should be carveout nodes, and
           should be defined with a "no-map" property as per the bindings in
           Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+
+          For IO+DDR low power mode support on AM62x SoCs, additional memory
+          regions may be defined to partition the DDR_LPM_DATA section:
+            [0] DMA allocations (required)
+            [1] IPC resources or firmware image sections
+            [2] LPM FS stub section
+            [3] LPM metadata section containing dmEntryPoint and fsCtxtAddr
+            [4] LPM FS context and reserved sections
+            [5] DM trace and firmware sections
+
+          The LPM metadata region at index 3 allows the bootloader to directly
+          read the LPM metadata address without hardcoded offsets.
         minItems: 2
         maxItems: 8
         items:
           - description: region used for dynamic DMA allocations like vrings and
                          vring buffers
-          - description: region reserved for firmware image sections
+          - description: region reserved for firmware image sections or IPC resources
+          - description: LPM FS stub binary and X.509 certificate
+          - description: LPM metadata (dmEntryPoint, fsCtxtAddr)
+          - description: LPM FS context data and reserved sections
+          - description: DM RM/PM trace and firmware code/data
         additionalItems: true
 
 # Optional properties:

-- 
2.51.0


