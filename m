Return-Path: <linux-remoteproc+bounces-372-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B60E5843B55
	for <lists+linux-remoteproc@lfdr.de>; Wed, 31 Jan 2024 10:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 578FB1F2A2D6
	for <lists+linux-remoteproc@lfdr.de>; Wed, 31 Jan 2024 09:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B10657BE;
	Wed, 31 Jan 2024 09:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cLnIxU0c"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7495D69959
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Jan 2024 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706694199; cv=none; b=koRJ7Na9lL2Dubu2ewGsupJPB7TmNZ4+h++Z5P5IwVqKAebvd08gBo7jK1ZSfR9dhSENsNp7UOSKQe/J4ps+aclfRdnartPisl4TYM4H8RGfgq4O10vR63TsYJPz0GISaX+tgK77HbUwgjZzmudUuLzSM17imRk7Rvt0IoBAFxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706694199; c=relaxed/simple;
	bh=gkIae8l+H2+F/jXvpvISUQcIXBcbsucEp1aonIBdbjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpLh22HD7xIAivPt27LbkHOLCcU0UnqYmEnlcDr/iDpQXORTtI60+9w5DEomYvs8tZrqtk2IIcWOVO6judgWTiqbMBORykGm/PYGE4fqG70Dbx09iWxiY4jS/AMQSnrb1Ya7mZ2qNfxKL7GA/ERc1eBeJosqC+TvFAbsowG9A5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLnIxU0c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706694196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oza1LRHp/M5RIj8Nm47urKrF572FUv22z3v7KOgdQu8=;
	b=cLnIxU0cbeHtPMXhbPMhNdSTxan7Ox4fuZSF5+1ncnLt/f2+yZUEiMcHQE4I39Upkb03zV
	mpkfF+THSvN4I2vwF1YmpAV/XA2lokqqw9RuVogk97RjLp2iTo7poWtFEfipsGWZqh3HCY
	FQavxRZAaj7KfsVmTTwRug3Q7z27Sp4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-FJfUW1UjOai9JB5A3YASCQ-1; Wed, 31 Jan 2024 04:43:14 -0500
X-MC-Unique: FJfUW1UjOai9JB5A3YASCQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33ae7046cd0so1630572f8f.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 31 Jan 2024 01:43:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706694193; x=1707298993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oza1LRHp/M5RIj8Nm47urKrF572FUv22z3v7KOgdQu8=;
        b=SNxkpNYrDRhz/gAeJl2xghnNfVQp5UK5smwqvpaQ7V0xF8vX5YRAjZRD+9BiNyRlrS
         1mc6Q78GE8ZaydcMgi/6g3ZMX8QxgpGOHQKuzbS7MNG2goanGSEIRnhac9SagRkcjr3p
         ABKRgbeEGw95YtUVXefzfRouJfF0WtpO5JDiNaZIQzxHthqfXHsXIja2VnpWGPxoFbzL
         BW/xRYRbr6U/p0tNRB8IjZuYY+frZ/MS4xhALSPaJOusMb0vlmQ+VK7vZUphlVGjCu5l
         lsbB/cftSvet6ibRR3sVO4IuSvFew4R2jE+tMb6A2+o3IXoQcxb0blLYE2IFkEMn7AJ9
         heBg==
X-Gm-Message-State: AOJu0Yx3rI5g7W5n94oyF6ORSbGmlLcGuVqfZVy4ELA64avfHIqWpGZJ
	I8LVhr0unnKKCJGbWyVr8gf9Uv0tT+zR84wieMF/L3po/1QDIi/Dx8BgGX8H/f0pR+OnCDmP8AI
	lO1lo7bhoXbTdYolJns3O/qWjSu3KYx5HJhoNDVvShtiUdSmExtZKV//CtoZcEG6Biac=
X-Received: by 2002:adf:fa05:0:b0:33a:e919:f406 with SMTP id m5-20020adffa05000000b0033ae919f406mr679904wrr.52.1706694193235;
        Wed, 31 Jan 2024 01:43:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3NLeG1aMawKGEQVu/0aqBjSNNGqzZmjOJyBzgiQ4QC6+fT4S4tC5TcuNgzowV5ynPiQEAwQ==
X-Received: by 2002:adf:fa05:0:b0:33a:e919:f406 with SMTP id m5-20020adffa05000000b0033ae919f406mr679860wrr.52.1706694192871;
        Wed, 31 Jan 2024 01:43:12 -0800 (PST)
Received: from redhat.com ([2a02:14f:1fb:b2de:3c63:2a5e:5605:4150])
        by smtp.gmail.com with ESMTPSA id cx18-20020a056000093200b0033935779a23sm12937651wrb.89.2024.01.31.01.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 01:43:12 -0800 (PST)
Date: Wed, 31 Jan 2024 04:43:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Yang Li <yang.lee@linux.alibaba.com>, linux-um@lists.infradead.org,
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
	kvm@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH vhost 04/17] virtio_ring: split: remove double check of
 the unmap ops
Message-ID: <20240131044244-mutt-send-email-mst@kernel.org>
References: <20240130114224.86536-1-xuanzhuo@linux.alibaba.com>
 <20240130114224.86536-5-xuanzhuo@linux.alibaba.com>
 <CACGkMEs-wUa_z_tGYEwBf7EVJAtuJdkX4HAdjqMXHEM1ys-gKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEs-wUa_z_tGYEwBf7EVJAtuJdkX4HAdjqMXHEM1ys-gKQ@mail.gmail.com>

On Wed, Jan 31, 2024 at 05:12:22PM +0800, Jason Wang wrote:
> I post a patch to store flags unconditionally at:
> 
> https://lore.kernel.org/all/20220224122655-mutt-send-email-mst@kernel.org/

what happened to it btw?

-- 
MST


