Return-Path: <linux-remoteproc+bounces-370-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D3A843ACB
	for <lists+linux-remoteproc@lfdr.de>; Wed, 31 Jan 2024 10:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 189201F2640D
	for <lists+linux-remoteproc@lfdr.de>; Wed, 31 Jan 2024 09:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871BE79DBF;
	Wed, 31 Jan 2024 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dNhod43E"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED07C633E9
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Jan 2024 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706692400; cv=none; b=Gsg3Y+w7Hp4bcCc6tmJKd1PAER19E5ybLTcgdHUfD8RWSgfWUyIn+3+/FfWbGO9614vO+AxyNe4L81OC78DjOBaV8XSdgX4jGv0cukp5wcGXB7Q4QRHBye2j+YrFVHUHRi8ZufWIryJkY4qwDXtR4pHvXJ4BJ866gSuQ4NkHh/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706692400; c=relaxed/simple;
	bh=ONLOpdhFVTK1PKOUo0h7113+HYlDSSoXMBK7/7cDZ1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7v7uJ7xTOUbjJCj0tFBfTasMwBbl2ziB+RZ34pcaRu+w5XJYHlCmUXOH1pfGvTl97YIEnihB98OPNdHmvujPM+qn6+5UGobQhigJkJg6jQVUAnyGHuutudklm/XTPMChNsmFHAIlkTnHWwz5Oo/Ix8oZ24r2d7TGNmothTd5Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dNhod43E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706692398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONLOpdhFVTK1PKOUo0h7113+HYlDSSoXMBK7/7cDZ1Q=;
	b=dNhod43Ejz9Mb8oXENtKKNS0jt7CSQqdFDFasc0HOjXWZOV9KgUnEFoV9f4iTdAoQrRl85
	k1rlszfDhi/oHPry2wTGI0W24A3mEZlwTXXAOtzOZ+Bklfsq7sSXb9OWSvRsFihiwsSqt3
	upwQgaofncC5BMMuKJu91OwoDoMHQIA=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-sO_x6I8fOG2Bk9V7Qh69GQ-1; Wed, 31 Jan 2024 04:13:16 -0500
X-MC-Unique: sO_x6I8fOG2Bk9V7Qh69GQ-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-46b3b76a6c5so925605137.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 31 Jan 2024 01:13:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706692396; x=1707297196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONLOpdhFVTK1PKOUo0h7113+HYlDSSoXMBK7/7cDZ1Q=;
        b=UBgJa8BDowRkcBW8ZIgIDRX0q6pD6GE3urM9p4LeogTpHrwx2J3uy/K17f0lbYjitN
         Tjd1ebKaW+7LNA8GQovryEVH+QtjktPWrJXfob29WYWgvTARvsK9DIm2v8bPiZS5NIP+
         Y4qMU/edbEEPo3ebjZpY/MU7pHY4zAwlOoeM3MkK0gHwc6toKFrJxG8r9M6+61AyEO3Q
         6KpkMfeTatU0KPubl7b0eh1BtE2w/80hR/44EtSKnC1d72vurb8Op1FcZm6hLpcWAEeF
         EECibdoUGvJFgO7cFfeNCRpjmIDodc2D+KkGsdSaIocO39G+87Ubv2XN0xsN8ENe63dk
         qD7Q==
X-Gm-Message-State: AOJu0YydcHFDcyFI6v7P6llvG2vwWWBtIxbkixZxor5K+/KBJ0bQE/TB
	/GQX2KXPQzRal9s1bWmGErrAT7TPNkZ0535TlL3B+2NETc7N3/YuJLldnLWSSH553+x97oFrD8l
	TgPAQa8mvBp9uqsB61prUPnJ/YFb7h538uSpZ0TWLknVG2t4t6CJJxh3oPobLjLMDsmDSnNpJoN
	N/iNbe1p8xan+XiPP7EelXnuYc1IhCurcL3VEkhXt9Mg==
X-Received: by 2002:a05:6102:2753:b0:468:90e:2c88 with SMTP id p19-20020a056102275300b00468090e2c88mr691980vsu.35.1706692395775;
        Wed, 31 Jan 2024 01:13:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlqIGzGC6WJa2cNQxkOvPsG3lWuLc6yY/NsL+Ul0eahHSt+TTWHH5K0CdWrrzXTYNRodEQ2LjsVmuQ6Q+WlRc=
X-Received: by 2002:a05:6102:2753:b0:468:90e:2c88 with SMTP id
 p19-20020a056102275300b00468090e2c88mr691962vsu.35.1706692395533; Wed, 31 Jan
 2024 01:13:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130114224.86536-1-xuanzhuo@linux.alibaba.com> <20240130114224.86536-12-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240130114224.86536-12-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 31 Jan 2024 17:12:43 +0800
Message-ID: <CACGkMEtWt1ROwJCeEa5FbQfxV2eqo0xRqHQZMsq-Q2TcQBur9g@mail.gmail.com>
Subject: Re: [PATCH vhost 11/17] virtio_ring: export premapped to driver by
 struct virtqueue
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	"Michael S. Tsirkin" <mst@redhat.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Benjamin Berg <benjamin.berg@intel.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, linux-um@lists.infradead.org, 
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 7:43=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> Export the premapped to drivers, then drivers can check
> the vq premapped mode after the find_vqs().

This looks odd, it's the charge of the driver to set premapped, so it
should know it?

Thanks


