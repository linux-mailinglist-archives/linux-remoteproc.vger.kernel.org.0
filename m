Return-Path: <linux-remoteproc+bounces-939-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB4988F65C
	for <lists+linux-remoteproc@lfdr.de>; Thu, 28 Mar 2024 05:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF0B11F2601B
	for <lists+linux-remoteproc@lfdr.de>; Thu, 28 Mar 2024 04:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37F138F91;
	Thu, 28 Mar 2024 04:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HzeMwpf4"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F00238389
	for <linux-remoteproc@vger.kernel.org>; Thu, 28 Mar 2024 04:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711600183; cv=none; b=I2y43fPfcTfiAOzra1TSIxun3BKyy5rCl1pMsG8JyAjVj+4bbjvXtRKxwpTRbwZDSGasY04x4nbs7TtHQ4a3IWui1MOCNzTWuWatPSYUDDq6xeAFw2J1Az5Z0eJX+mtNlp4HBg330BEIzkN0FbVCoHKCy2KDQEKJsGMvQe0ktyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711600183; c=relaxed/simple;
	bh=1QzCz1Z3ysjSBtKSuwdaJecZAl0r65qpJTzi3fJyIfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VErTX6jXWvlCkn2ktyyXvKKxtwa0c8ZB5Uv4srOVheRRD9g0SqdeBiCnZPBCddNNpQwm5O3ZXHdelPMmxpBfJI+QZiXkaTtE+1NvHmRmwfEPbPuqi3U9KKL9My2+3T04x4G8CeWJdxceziToOZvxz5sZG11vFiro2S1/x37dt78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HzeMwpf4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711600181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1QzCz1Z3ysjSBtKSuwdaJecZAl0r65qpJTzi3fJyIfg=;
	b=HzeMwpf4plDjQ/ZbORqWZ7/ykUus+X2WuryLsJkk4+xEN3gdS1RnystF8Dhwd1C9B58JiL
	Odjde8uOiB4qA3KCMGUsmquqhnVjX1jh4D82cT5mP6pCJ6CrgC0dIGSbZ1xkjGSxufft5U
	9QzaDIbahlSy9UUMswaxxsLAXhs+jaE=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-iK3N2dzSMp-d2oM2xLa6bA-1; Thu, 28 Mar 2024 00:29:39 -0400
X-MC-Unique: iK3N2dzSMp-d2oM2xLa6bA-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-6e73833c7f6so465578b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 21:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711600178; x=1712204978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QzCz1Z3ysjSBtKSuwdaJecZAl0r65qpJTzi3fJyIfg=;
        b=Rnjf4ftKv4umXTM+G37UuA3Gxqo8422xWbErdEpF0y3lUlUSk3z1nhiRCK+NI/X/cM
         TtkRvVN8ve4RX9Wm3AbVf7wnRSmMuALw4ATukEpf2lNqQrMfKr+3s2oycg8LdudBy9Cy
         vjeMFm7LlI9etqwywmF+9zeyVH0pWS6zIcgKdrpHtk7CjeV8BuW39MJ3acXEJEKw5hy9
         rRCEWVh3o3g5s7Py+chvBgZeTrpKinrvKwBP2dOHNwKQK+tm87sv6G9BU+pacza12LzR
         pzbOl+O437NCCTTuubWnwbMH1/DX6vw9IVR1rXwQp3SDLcfOz5yhp03HyYSuCKzCYzTF
         enjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+ZDrg7DshC1vz2gRtlRKDmP3AYEnsPwltMSNy3tG5X/7wsfFj2Ra3THtMldF1xhrL3ujVN0x649p0yDBumNl9uR+S3TBpfh9PsEgL8uGfNg==
X-Gm-Message-State: AOJu0Yxr+MeEXNbVxbZlA1SZaimXtOOHsMcOZI/g6dTdzS/dgkVjcgZq
	yUK8wlDhdbDf7LozVbjjO9jiV5EByhZk+f8VswI18pW/01pPcUjyx3oi76q7Sq+YcGWdSAKUBNI
	TWR0TwVIYREaG3g0155HF/P5U487mDzKgQJzKkpji1PyyU5SYXIzVafw1LDac1bV1peJRV5RfHv
	QAxp2erDieNVoeeEZR6qvYdDVhcXmqkOgESWjRMvEOZg==
X-Received: by 2002:a05:6a20:7f9b:b0:1a3:6ed2:ee27 with SMTP id d27-20020a056a207f9b00b001a36ed2ee27mr2348494pzj.16.1711600178150;
        Wed, 27 Mar 2024 21:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdRSG9G7uJHKVNNXcj0F+YxANq94mAXIs7d49a5PjNlTRz4N2ThVivJdAz+RFXtJHhPLT9mm3BTBAY6vJ4ZyA=
X-Received: by 2002:a05:6a20:7f9b:b0:1a3:6ed2:ee27 with SMTP id
 d27-20020a056a207f9b00b001a36ed2ee27mr2348485pzj.16.1711600177897; Wed, 27
 Mar 2024 21:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327095741.88135-1-xuanzhuo@linux.alibaba.com> <20240327095741.88135-5-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240327095741.88135-5-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Mar 2024 12:29:26 +0800
Message-ID: <CACGkMEvAUNSC2VnTLpbCR4Zq=rTOW-CHvXLvB1PuGadf6J77UQ@mail.gmail.com>
Subject: Re: [PATCH vhost v6 4/6] virtio: vring_create_virtqueue: pass struct
 instead of multi parameters
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	David Hildenbrand <david@redhat.com>, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 5:58=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> Now, we pass multi parameters to vring_create_virtqueue. These parameters
> may from transport or from driver.
>
> vring_create_virtqueue is called by many places.
> Every time, we try to add a new parameter, that is difficult.
>
> If parameters from the driver, that should directly be passed to vring.
> Then the vring can access the config from driver directly.
>
> If parameters from the transport, we squish the parameters to a
> structure. That will be helpful to add new parameter.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Acked-by: Johannes Berg <johannes@sipsolutions.net>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


