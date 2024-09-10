Return-Path: <linux-remoteproc+bounces-2175-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE1A973B34
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Sep 2024 17:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D44D2863AE
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Sep 2024 15:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C1C19755E;
	Tue, 10 Sep 2024 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SoS6ls0j"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360D5194132
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Sep 2024 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981235; cv=none; b=E0SQntfj8SNhSX/natHVVOytWEDoPH/xok8GK50KkmMWjwgob0l1Si8XiGLwp8zkp5/Kj8nY4f/I2LXm5QUnJ/ZWeHb1Io+LSXyswPEFowukfGAc9Y5vvexN6Ih8OGdNlLWgWySA/K5/CBxlvANkUdnMMyTIrQXdjXrIgKDfEz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981235; c=relaxed/simple;
	bh=bcZOdJRoNBfJ+ROPezMP5F8tvvSftOaOFYUHlUJ7yFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kaxzz7161nwubRpoM1gCeCFmCWSh4fNS/LE4jwcceT3k2tmaTKYZrUp2NXeOTAIrZN++wpirQVP9BTiGgQCyxvfVERoMxSKYqRSCItW4D+CMF1ABcDJpUjYxJQ5aKjuBhvJ7IrBVB/3fvFXQjRHb4bd3S9zXhyZY2mQFnkeresw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SoS6ls0j; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so3792615a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Sep 2024 08:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725981233; x=1726586033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fevn6n5NuaL62PrfiTwcBMvzcagqegbJyq9ky3eV6kc=;
        b=SoS6ls0jnn8NRL1hikmHFvLZq64zJeEJpjNtAV+XS5waVp8HKiWImoc2aN54t2H5MS
         k6kIwugR1OuCzbShITvcVH7ItjUVx9wRqXSKXdXYjMjsW3Bd+eq9SpoCMiSqrzG9oLBt
         TXdO3HArGtlseUizpxstwsjFE1sNcrlP6hSCGCOLG8ruXre6zgTExUWlGGkpnGZgGulx
         dTTzfd7TMAzIlkXaM4Bc8C/qIIK0o6VUyQ8Omi4KXlzvX+uBKBGBJhpgitgaTdl+NQHM
         t2g1NiZ3PFHTb9BpVXF15kvvkSBqm7XYi9J6f2xVLdy6faIfgXCfWtrPeu3Y/e4MeJCR
         oiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725981233; x=1726586033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fevn6n5NuaL62PrfiTwcBMvzcagqegbJyq9ky3eV6kc=;
        b=oC0S4Qo1GrQIh+rWpPPNk3hifDYBzVBLXFfYYPhUweiUXLkSRhR/jmLOZ0afMPk3CE
         prgqiz7Ydt4fMo8Bo3S5UapPd3e+jMaLFP22Pn1XvUk6sRIHNYyu97tVsT4wktaXKY77
         uTObFF7Z3EUyKVwxHBaXygPhacJiU2wcfokGrf9McSgnjWGraFPJ/V+oIMPMCye+0Trq
         8aZXArOBTf3V6kXjRkaQdZ+T/KfGfo0zxIGWTzUysb8NE81jZQ3pXsDlk+fwSwNiSWrw
         ThpJpRM9l5ZWHY4sc4mOw951iGH4G6dOGc1O4OCyfhFVStiuWmWx5Kqx8JWI4eKB59LO
         DqIw==
X-Forwarded-Encrypted: i=1; AJvYcCXHyyPGJzMTbRtyWGVE+ds894FQH7Y+83twsAgpZU4NrAbcviC9hl7qJ//aqg7vz4qHVWhZ+YZicC0z5saXgxIx@vger.kernel.org
X-Gm-Message-State: AOJu0YzsrBj8NwZsVW8DBiYaKAXYFds7kzKpb6XC7yTfRj+CerVDREvx
	RLN/dRr1w6niul2Q3Eei5moWDpnnw+yfjRHv18vl/JZxFiFZl1GFW47ncaxX1so=
X-Google-Smtp-Source: AGHT+IE7a2t00IeD7CgjCZrR6pwg269HrhG9j0feoGsdPztSeUi2iGfsoHePGNpWWIcfmMkIPNyKRA==
X-Received: by 2002:a05:6a20:cfa6:b0:1cf:476f:2d10 with SMTP id adf61e73a8af0-1cf5e198a0fmr1490386637.49.1725981233417;
        Tue, 10 Sep 2024 08:13:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b385:464:5921:35eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fc8459sm1485084b3a.24.2024.09.10.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 08:13:52 -0700 (PDT)
Date: Tue, 10 Sep 2024 09:13:50 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Doug Miller <doug.miller@cornelisnetworks.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	OFED mailing list <linux-rdma@vger.kernel.org>,
	"Dalessandro, Dennis" <dennis.dalessandro@cornelisnetworks.com>
Subject: Re: How to create/use RPMSG-over-VIRTIO devices in Linux
Message-ID: <ZuBiLgxv6Axis3F/@p14s>
References: <cff37523-d400-4a40-8fd1-b041a9b550b5@cornelisnetworks.com>
 <70cf5f00-c4bf-483a-829e-c34362ba8a70@cornelisnetworks.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70cf5f00-c4bf-483a-829e-c34362ba8a70@cornelisnetworks.com>

On Tue, Sep 10, 2024 at 08:12:07AM -0500, Doug Miller wrote:
> On 9/3/2024 10:52 AM, Doug Miller wrote:
> > I am trying to learn how to create an RPMSG-over-VIRTIO device
> > (service) in order to perform communication between a host driver and
> > a guest driver. The RPMSG-over-VIRTIO driver (client) side is fairly
> > well documented and there is a good example (starting point, at least)
> > in samples/rpmsg/rpmsg_client_sample.c.
> > 
> > I see that I can create an endpoint (struct rpmsg_endpoint) using
> > rpmsg_create_ept(), and from there I can use rpmsg_send() et al. and
> > the rpmsg_rx_cb_t cb to perform the communications. However, this
> > requires a struct rpmsg_device and it is not clear just how to get one
> > that is suitable for this purpose.
> > 
> > It appears that one or both of rpmsg_create_channel() and
> > rpmsg_register_device() are needed in order to obtain a device for the
> > specific host-guest communications channel. At some point, a "root"
> > device is needed that will use virtio (VIRTIO_ID_RPMSG) such that new
> > subdevices can be created for each host-guest pair.
> > 
> > In addition, building a kernel with CONFIG_RPMSG, CONFIG_RPMSG_VIRTIO,
> > and CONFIG_RPMSG_NS set, and doing a modprobe virtio_rpmsg_bus, seems
> > to get things setup but that does not result in creation of any "root"
> > rpmsg-over-virtio device. Presumably, any such device would have to be
> > setup to use a specific range of addresses and also be tied to
> > virtio_rpmsg_bus to ensure that virtio is used.
> > 
> > It is also not clear if/how register_rpmsg_driver() will be required
> > on the rpmsg driver side, even though the sample code does not use it.
> > 
> > So, first questions are:
> > 
> > * Am I looking at the correct interfaces in order to create the host
> > rpmsg device side?
> > * What needs to be done to get a "root" rpmsg-over-virtio device
> > created (if required)?
> > * How is a rpmsg-over-virtio device created for each host-guest driver
> > pair, for use with rpmsg_create_ept()?
> > * Does the guest side (rpmsg driver) require any special handling to
> > plug-in to the host driver (rpmsg device) side? Aside from using the
> > correct addresses to match device side.
> 
> It looks to me as though the virtio_rpmsg_bus module can create a
> "rpmsg_ctl" device, which could be used to create channels from which
> endpoints could be created. However, when I load the virtio_rpmsg_bus,
> rpmsg_ns, and rpmsg_core modules there is no "rpmsg_ctl" device created
> (this is running in the host OS, before any VMs are created/run).
>

At this time the modules stated above are all used when a main processor is
controlling a remote processor, i.e via the remoteproc subsystem.  I do not know
of an implementation where VIRTIO_ID_RPMSG is used in the context of a
host/guest scenario.  As such you will find yourself in uncharted territory.  

At some point there were discussion via the OpenAMP body to standardize the
remoteproc's subsystem establishment of virtqueues to conform to a host/guest
scenario but was abandonned.  That would have been a step in the right direction
for what you are trying to do.

> Is this the correct way to use RPMSG-over-VIRTIO? If so, what actions
> need to be taken to cause a "rpmsg_ctl" device to be created? What
> method would be used (in a kernel driver) to get a pointer to the
> "rpmsg_ctl" device, for use with rpmsg_create_channel()?
> 
> > 
> > Thanks,
> > Doug
> > 
> 
> External recipient

