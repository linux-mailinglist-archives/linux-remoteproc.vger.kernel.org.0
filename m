Return-Path: <linux-remoteproc+bounces-1685-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2403913976
	for <lists+linux-remoteproc@lfdr.de>; Sun, 23 Jun 2024 12:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39FD283021
	for <lists+linux-remoteproc@lfdr.de>; Sun, 23 Jun 2024 10:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B5678283;
	Sun, 23 Jun 2024 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZBIjQUe"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FE785298
	for <linux-remoteproc@vger.kernel.org>; Sun, 23 Jun 2024 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719137707; cv=none; b=qnLJY1x/ONGmxeMxNswBDBJ8Pde9u4/AmJGMBxUwEsSn2TlxEw60BB/hfjg4j+znSkmZ6L52mWOsE8X1ti2CxNZTWCX+LlT3hopwAt4ptuEvxhMW1NrU+IXNWTxj1Et19Z7DnyXkPbegtwDJKld/T9q6+CTljQIChe9FbyWhIIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719137707; c=relaxed/simple;
	bh=OuR2sYZAr2eBHxaMxpLs26oNyCGBj4JLZvUZ0k+VmS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LX2oTcJH32qTF2Hg5c2Kwaf9X8zsLZmXkpuRrWxvb11Mj30fZkN5LC/Mr/XlmQGXIMs5p0xgEavVL7PPeu9j8NV7oQwGd55Xmr6RTjqULmILAfiKKxhi4CYwm1vg60sclXq2HYO1uNZx7z+lslxJzJhgIFU6UPnLL1xuJZiYFGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aZBIjQUe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719137704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sOci2B9Gr4WI6Fbop3cV6xh51JciMNHVROXI0Qgvuqs=;
	b=aZBIjQUeGKIO1FQp5W1oNjRQpDASA35eq+HF3GawsyzUVDEO3hYoZZED111KafQWNjv/y7
	DVzLW34wQFtazkjRa9sri9bPFgt6D7zd5Pby/9s3TdSXxwnWUzVf6s644W/pq0D3a3Pf2P
	qBV3i3vIMUFD36/XdQaMV83GsJhUJJo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-OCd662vUOr6h8zYze-MLVw-1; Sun, 23 Jun 2024 06:15:03 -0400
X-MC-Unique: OCd662vUOr6h8zYze-MLVw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-366e0a4c965so490066f8f.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 23 Jun 2024 03:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719137702; x=1719742502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOci2B9Gr4WI6Fbop3cV6xh51JciMNHVROXI0Qgvuqs=;
        b=uTP9+38S87lfP7Umojx25lPoEcBau1jM1P7sUSLe/19gkC5PEZpTPw3kNOrpdTz1XZ
         C9vKXVTbNHfXq0hR1FejuDXDNoJceFxE/lv5r/EInHVyYSahLr2TZbLozgq38BPzNv4m
         G5o9fP0j6yVMrotgKOjt7dgB/PGNlczbWxuEnkwueVVgSSkqI8BgiyMwERaRMP/EXYxR
         wxf50QQ0ydNgYF2OKb3hoHGkUfvkjdwxUxnSJ59AisoVz9PqI8j0dBOEsf7WW1m9PT08
         RI1dEN3ffpJs+Mq6iwfJwAKJSCpS2wZpKvOkcJCsNKREEXRj9KkN2WUZMm7PWdNMr7Gr
         jWkw==
X-Forwarded-Encrypted: i=1; AJvYcCWIKZrlrHCZn5cqWbiEdc+hcFHxkbv5dzgMapYxTUay5T1Mwewf02XLUNuXxsXCuL1h4rcs4Ass3SMyrHbqnyRarZfd4df1kJCz7+IQFcUc8A==
X-Gm-Message-State: AOJu0YzDcdLaB+W7zZFNDbOhbhbbfzVVEUMAPWHOySf9NvuRnFon7ocR
	JS3zR+Q9xHR4cmQzUtSE0irsU5fiyELAAPUy4uGdufBS+qI4J/rr17p4bsrkA/vXSUozu6XmhK+
	7TuWXEzGmi0RTRf3GSHUBrJi2gNgnqhIPQYAeDCZ/erUABTGiriDQwWWzsnDFXj2bXkk=
X-Received: by 2002:a05:6000:dcd:b0:35f:1c34:adfc with SMTP id ffacd0b85a97d-366e96bf06bmr1002439f8f.67.1719137701822;
        Sun, 23 Jun 2024 03:15:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPPDC3HI60pWL+wtMB9iK/gooIH7i9Iz/3lSKlTGUXQzR11017FM83y2VnixVMSw+lIyxO0Q==
X-Received: by 2002:a05:6000:dcd:b0:35f:1c34:adfc with SMTP id ffacd0b85a97d-366e96bf06bmr1002414f8f.67.1719137701075;
        Sun, 23 Jun 2024 03:15:01 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b861bsm6874269f8f.29.2024.06.23.03.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 03:15:00 -0700 (PDT)
Date: Sun, 23 Jun 2024 06:14:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
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
	David Hildenbrand <david@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: Re: [PATCH vhost v9 2/6] virtio: remove support for names array
 entries being null.
Message-ID: <20240623061141-mutt-send-email-mst@kernel.org>
References: <20240424091533.86949-1-xuanzhuo@linux.alibaba.com>
 <20240424091533.86949-3-xuanzhuo@linux.alibaba.com>
 <20240620035749-mutt-send-email-mst@kernel.org>
 <1718872778.4831812-1-xuanzhuo@linux.alibaba.com>
 <20240620044839-mutt-send-email-mst@kernel.org>
 <DS0PR11MB6373310FBF95058B8FE8CD95DCCA2@DS0PR11MB6373.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB6373310FBF95058B8FE8CD95DCCA2@DS0PR11MB6373.namprd11.prod.outlook.com>

On Sat, Jun 22, 2024 at 06:07:35AM +0000, Wang, Wei W wrote:
> On Thursday, June 20, 2024 5:01 PM, Michael S. Tsirkin wrote:
> > On Thu, Jun 20, 2024 at 04:39:38PM +0800, Xuan Zhuo wrote:
> > > On Thu, 20 Jun 2024 04:02:45 -0400, "Michael S. Tsirkin" <mst@redhat.com>
> > wrote:
> > > > On Wed, Apr 24, 2024 at 05:15:29PM +0800, Xuan Zhuo wrote:
> > > > > commit 6457f126c888 ("virtio: support reserved vqs") introduced
> > > > > this support. Multiqueue virtio-net use 2N as ctrl vq finally, so
> > > > > the logic doesn't apply. And not one uses this.
> > > > >
> > > > > On the other side, that makes some trouble for us to refactor the
> > > > > find_vqs() params.
> > > > >
> > > > > So I remove this support.
> > > > >
> > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > > > Acked-by: Eric Farman <farman@linux.ibm.com> # s390
> > > > > Acked-by: Halil Pasic <pasic@linux.ibm.com>
> > > >
> > > >
> > > > I don't mind, but this patchset is too big already.
> > > > Why do we need to make this part of this patchset?
> > >
> > >
> > > If some the pointers of the names is NULL, then in the virtio ring, we
> > > will have a trouble to index from the arrays(names, callbacks...).
> > > Becasue that the idx of the vq is not the index of these arrays.
> > >
> > > If the names is [NULL, "rx", "tx"], the first vq is the "rx", but
> > > index of the vq is zero, but the index of the info of this vq inside the arrays is
> > 1.
> > 
> > 
> > Ah. So actually, it used to work.
> > 
> > What this should refer to is
> > 
> > commit ddbeac07a39a81d82331a312d0578fab94fccbf1
> > Author: Wei Wang <wei.w.wang@intel.com>
> > Date:   Fri Dec 28 10:26:25 2018 +0800
> > 
> >     virtio_pci: use queue idx instead of array idx to set up the vq
> > 
> >     When find_vqs, there will be no vq[i] allocation if its corresponding
> >     names[i] is NULL. For example, the caller may pass in names[i] (i=4)
> >     with names[2] being NULL because the related feature bit is turned off,
> >     so technically there are 3 queues on the device, and name[4] should
> >     correspond to the 3rd queue on the device.
> > 
> >     So we use queue_idx as the queue index, which is increased only when the
> >     queue exists.
> > 
> >     Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> >     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> 
> The approach was taken to prevent the creation (by the device) of unnecessary
> queues that would remain unused when the feature bit is turned off. Otherwise,
> the device is required to create all conditional queues regardless of their necessity.
> 
> > 
> > Which made it so setting names NULL actually does not reserve a vq.
> 
> If there is a need for an explicit queue reservation, it might be feasible to assign
> a specific name to the queue(e.g. "reserved")?
> This will require the device to have the reserved queue added.

That's quite a hack, NULL as a special value is much more
idiomatic.

Given driver and qemu are both non spec compliant but *in splightly
different ways* I think we should just fix both the driver and qemu to
be spec compliant.


> > 
> > But I worry about non pci transports - there's a chance they used a different
> > index with the balloon. Did you test some of these?
> > 
> > --
> > MST
> > 


