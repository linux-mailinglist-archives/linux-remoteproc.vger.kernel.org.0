Return-Path: <linux-remoteproc+bounces-897-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 110B988CE9F
	for <lists+linux-remoteproc@lfdr.de>; Tue, 26 Mar 2024 21:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D7BAB2790F
	for <lists+linux-remoteproc@lfdr.de>; Tue, 26 Mar 2024 20:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800B113FD90;
	Tue, 26 Mar 2024 20:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oA1E0f2C"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A6613F440
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 Mar 2024 20:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484668; cv=none; b=JGsXYB3CfwWr4CBY5LJNCkpAiQWz7W0Pgwgksglb9pZ61aja7GrmrKlcGNdAfjiLy7oL+nVuNKSsiyNq1Gf/6wK0lJWM4d5PreyQTihGdLobRbFpobusAq0yRlvYtrcKlJvYMm8xmnOTsWiPMDt1/qhSUttl7CEl2AsS8OKnapY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484668; c=relaxed/simple;
	bh=mWwfdGmaJI5/v599SuFLYqcN0BETsqK70kzkErBfIJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bb0aGmFMeU0Ai+hBTp8FFOJLAdObrTyCpxZ50GlbbDeYygpYxqP7MQRiNcahavWa87IPtz88jNmahqad1rI+nLu422tq5g1ExmDoWoxNqakwP94fDCqEZzBTiFLsXDpVelTY4heI94hTNlTXpMlDOtX7c92Y9Zrq6yAw4PGb5CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oA1E0f2C; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a466fc8fcccso768964666b.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 Mar 2024 13:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711484664; x=1712089464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnO3hfDzNJhG1W8n4621OnBzOy9cpmEtEz5rXGN5tRg=;
        b=oA1E0f2CaB1GiL1dpzV8XMmWO4z7f9HPGDLCdu4gLvaMwa5GuenxGmFtEGypCE1RIr
         5J0kveoU40wYNgDxkqqW626XiMeog2jBfgkt1QGcEv9O+1ev9nHMyV0m/Mj9xawhkFAA
         yJ250IP+MOMCMXsWcyZTR2WCeMEYQJeiR3TdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484664; x=1712089464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnO3hfDzNJhG1W8n4621OnBzOy9cpmEtEz5rXGN5tRg=;
        b=RO52Uokqs6jya5Jc4shjf7maWornQ4wEuDZVeifXh6xRSxHya9W+VCFmCx/Rm+HbPV
         +6CpvlnL2Qgu33rTxsMknptSB9JeW6lSd/ZKT5GVXwPV8kIUJwLju0Y3Za38QhNEEU53
         DFH76SPEwNEspsQh8ulExPe8upq7yuQB6svHKnOvSBYUaz3WFknh5jkpdkSWjJEwuHtL
         9RM2wFpYaDV2L45tfogTEl0+CafqCSZ5jOumcYbQBjeVxhWK7flSZf7EBs4reTvUoQ0n
         mTlcw23PNvtf3awVAMnyR3FhrsXqyziPJWopR+xwWnpPF6+Tn1QX3uqbL6yzbJZ1EtQK
         YPrA==
X-Forwarded-Encrypted: i=1; AJvYcCXZvL2QbdMj1lp7eeDbNVHnPueLacWTuPlwBo60q1gtjZDDYhSRnwqHEpvIKhLLJilo6WVEdQGIGQ9Rb3Be5jpzDJt/R2sRSDYsqTpQtxzdhQ==
X-Gm-Message-State: AOJu0YzmNKVq0QYeGeTmhsCxBJ9mx6Tx3amb7fhhOk+IM796sB52wKCb
	a2lqoahBk71/DfKafO32bVymmUzBshNp8sPv+NyR8RR6CLIHZyKUdLfnuC4p3XiwyiNy4a+uGGs
	eiA==
X-Google-Smtp-Source: AGHT+IFKc5VGLHC0xckyLGA7IvrEClskRJKR5ZE1wFcZ2M8dwAxJIF0zbvttLtLnhk1abnn7KL7YaQ==
X-Received: by 2002:a17:906:6bd7:b0:a46:bbb3:f0d2 with SMTP id t23-20020a1709066bd700b00a46bbb3f0d2mr1603692ejs.47.1711484664147;
        Tue, 26 Mar 2024 13:24:24 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id e23-20020a1709062c1700b00a47147abc95sm4544551ejh.41.2024.03.26.13.24.23
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 13:24:23 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4148c65e890so11250275e9.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 Mar 2024 13:24:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKDdHsUjBtADtVWlgYQD5Bm7UKMB7sJU6RI4KzMIqjtrvZ2LbBL4xUU+s2wusqN1xgDpNiLQkavhugLNtOisnT52SMOv7omPOwQ567t18OHw==
X-Received: by 2002:a17:907:2686:b0:a47:3c66:b396 with SMTP id
 bn6-20020a170907268600b00a473c66b396mr1888708ejc.64.1711484642859; Tue, 26
 Mar 2024 13:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321101532.59272-1-xuanzhuo@linux.alibaba.com>
 <20240321101532.59272-2-xuanzhuo@linux.alibaba.com> <CABVzXAkwcKMb7pC21aUDLEM=RoyOtGA2Vim+LF0oWQ7mjUx68g@mail.gmail.com>
 <b420a545-0a7a-431c-aa48-c5db3d221420@redhat.com> <1711346901.0977402-2-xuanzhuo@linux.alibaba.com>
 <041867ab-6cff-4bd1-9a44-2ca847c1ad63@redhat.com>
In-Reply-To: <041867ab-6cff-4bd1-9a44-2ca847c1ad63@redhat.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Tue, 26 Mar 2024 13:23:35 -0700
X-Gmail-Original-Message-ID: <CABVzXA=QHxAbkN5qorb5e8gKtd-c9P61z_ft07PPkkzaDMxB_A@mail.gmail.com>
Message-ID: <CABVzXA=QHxAbkN5qorb5e8gKtd-c9P61z_ft07PPkkzaDMxB_A@mail.gmail.com>
Subject: Re: [PATCH vhost v4 1/6] virtio_balloon: remove the dependence where
 names[] is null
To: David Hildenbrand <david@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	linux-um@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 2:11=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 25.03.24 07:08, Xuan Zhuo wrote:
> > On Fri, 22 Mar 2024 22:02:27 +0100, David Hildenbrand <david@redhat.com=
> wrote:
> >> On 22.03.24 20:16, Daniel Verkamp wrote:
> >>> On Thu, Mar 21, 2024 at 3:16=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.ali=
baba.com> wrote:
> >>>>
> >>>> Currently, the init_vqs function within the virtio_balloon driver re=
lies
> >>>> on the condition that certain names array entries are null in order =
to
> >>>> skip the initialization of some virtual queues (vqs). This behavior =
is
> >>>> unique to this part of the codebase. In an upcoming commit, we plan =
to
> >>>> eliminate this dependency by removing the function entirely. Therefo=
re,
> >>>> with this change, we are ensuring that the virtio_balloon no longer
> >>>> depends on the aforementioned function.
> >>>
> >>> This is a behavior change, and I believe means that the driver no
> >>> longer follows the spec [1].
> >>>
> >>> For example, the spec says that virtqueue 4 is reporting_vq, and
> >>> reporting_vq only exists if VIRTIO_BALLOON_F_PAGE_REPORTING is set,
> >>> but there is no mention of its virtqueue number changing if other
> >>> features are not set. If a device/driver combination negotiates
> >>> VIRTIO_BALLOON_F_PAGE_REPORTING but not VIRTIO_BALLOON_F_STATS_VQ or
> >>> VIRTIO_BALLOON_F_FREE_PAGE_HINT, my reading of the specification is
> >>> that reporting_vq should still be vq number 4, and vq 2 and 3 should
> >>> be unused. This patch would make the reporting_vq use vq 2 instead in
> >>> this case.
> >>>
> >>> If the new behavior is truly intended, then the spec does not match
> >>> reality, and it would need to be changed first (IMO); however,
> >>> changing the spec would mean that any devices implemented correctly
> >>> per the previous spec would now be wrong, so some kind of mechanism
> >>> for detecting the new behavior would be warranted, e.g. a new
> >>> non-device-specific virtio feature flag.
> >>>
> >>> I have brought this up previously on the virtio-comment list [2], but
> >>> it did not receive any satisfying answers at that time.
> >>
> >> Rings a bell, but staring at this patch, I thought that there would be
> >> no behavioral change. Maybe I missed it :/
> >>
> >> I stared at virtio_ccw_find_vqs(), and it contains:
> >>
> >>      for (i =3D 0; i < nvqs; ++i) {
> >>              if (!names[i]) {
> >>                      vqs[i] =3D NULL;
> >>                      continue;
> >>              }
> >>
> >>              vqs[i] =3D virtio_ccw_setup_vq(vdev, queue_idx++, callbac=
ks[i],
> >>                                           names[i], ctx ? ctx[i] : fal=
se,
> >>                                           ccw);
> >>              if (IS_ERR(vqs[i])) {
> >>                      ret =3D PTR_ERR(vqs[i]);
> >>                      vqs[i] =3D NULL;
> >>                      goto out;
> >>              }
> >>      }
> >>
> >> We increment queue_idx only if an entry was not NULL. SO I thought no
> >> behavioral change? (at least on s390x :) )
> >>
> >> It's late here in Germany, so maybe I'm missing something.
> >
> > I think we've encountered a tricky issue. Currently, all transports han=
dle queue
> > id by incrementing them in order, without skipping any queue id. So, I'=
m quite
> > surprised that my changes would affect the spec. The fact that the
> > 'names' value is null is just a small trick in the Linux kernel impleme=
ntation
> > and should not have an impact on the queue id.
> >
> > I believe that my recent modification will not affect the spec. So, let=
's
> > consider the issues with this patch set separately for now. Regarding t=
he Memory
> > Balloon Device, it has been operational for many years, and perhaps we =
should
> > add to the spec that if a certain vq does not exist, then subsequent vq=
s will
> > take over its id.
>
> Right, if I am not missing something your patch should have no
> functional change in that regard (that the current
> behavior/implementation might not match the spec is a different discussio=
n).
>
> @Daniel, if I'm missing something, please shout.

Thanks for digging into that - I think you're correct in that the
patch does not change the behavior, due to changes elsewhere in the
generic virtio and virtio-pci code. So in that sense, I guess this
should not block this particular patch.

It would be good to have the spec situation cleared up, though - I
guess in practice, all relevant drivers and device implementations are
already following the model where there are no gaps in the queue
numbering, rather than what the spec seems to indicate.

Thanks,
-- Daniel

