Return-Path: <linux-remoteproc+bounces-5116-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 143FCBFE5C6
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Oct 2025 23:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67C3E4E2574
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Oct 2025 21:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4EF2F7ACF;
	Wed, 22 Oct 2025 21:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uy7hFFhq"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C0E30498F
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 21:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761170378; cv=none; b=G5NYWxe6iG5VRMYkW/wQm0Bimaifq6JwjEjjVz21AF5PhDeptawFazmCEpT4C+Ii2/Zc6dsfE/Ns7l6QuNUfvRL3ja+yCzaGnhUb9ps8SNmYFiWQby8L1YUGcQsWdZxMRVqjzdcFWNBti33Ls26ntVqSrsyKmBKmolLuygN0q8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761170378; c=relaxed/simple;
	bh=6Lmdl/d0XVsaLCtwsi28T4Xf4eBIpeWsW0jUCw4uO0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVQQ43BNknMbTCTD78X16yl9FBl0E1lI+AGiUiXvnjXZkTrKwg6/dyspG1Tx3n327o6E0muEz13TurItdsYN3JdurGMWWCmRtQoUx0vQ19iyAxKf7ISLdPCAMf3+yQacQIXNTytH6o5IsFWBmC/nR0+yt0pRW/u4BSJctHO7OXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uy7hFFhq; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-63d6ee383bdso135261a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 14:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761170374; x=1761775174; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CqXQ9PbkvyGKWuYBFnVQlduNwYkc8UtO5Zh7UNPzjHQ=;
        b=Uy7hFFhqvPxuHFQcV/+sBaaGlz6HFIpEn207w4gDx3RwIxutVPxlwgepS+ta06mxmx
         /p7QpHqDu870rnKxVTnEY+02X1PV4FbfyUFHzVcOKRICAJ6nu5iO4T1qTDN+swHZDeOk
         Nl1cafyGqqGHBQ/irTp3/f6v3Ah3woefDEJpymwLXt0G1JxmLAYXUMCKVLOqRfwmNWuZ
         8wfkzQqYaIbyT+qeWAApcbA1WPipdGthK+9gC00FvMW7dvvXQPWUJOwOP2EEuhslYbA1
         kroozj9xMCN98P6QOSVpHGaMmJHKDuZPT4J+pXzkOST/VYXXisFfRpN2ZszaRLQ3EzDi
         OnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761170374; x=1761775174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqXQ9PbkvyGKWuYBFnVQlduNwYkc8UtO5Zh7UNPzjHQ=;
        b=EXNW3JNMR+SypXKBebB1/+clrNiMvh//kwLVXuQ6cOT/K/yey+ckh15RgwVBZ8JRXL
         d38Dn8frPlZ+7vmENcg90rv77IwfQUWcn8UtKwNXVa2iZ7uKgZuk3dMT4V4SKhj9E3PR
         38evSLhL490VsBlwYCwiCb+TCb8k15q8iLw6a5XFWCnfRAOBFZU/EGFIsdrv1bRWS13T
         PAQEokptuK5beQXbGbdFsOm1vdt4MNLqLd29NhtXoRJ4hVCOKs0FJPTAXqxwshmtn3z7
         2DN81ESqWlRhqAIWa97zNGJHTjw9k4uQ2J5eLEFuPEHG0sGb4ZKqO+3kdL562qFiSQ2p
         v/Iw==
X-Gm-Message-State: AOJu0Yw+QaswCxIgU2fJD1FHBx51oeT6st6kVGV1b/5TzkneAXN1jPsN
	6i26hA0R31HzWTsHzX0Fysyk9Cf5MKM7h2Kb6TivGkHHb8bMGcdAi76F2BWbPv5FYT7bxM4hbpv
	13QtRj8lWxiiqvj2FndlfRFv/Q1rexeE=
X-Gm-Gg: ASbGncvInOQI/SmkHb7GijCxKaV83h+Em6ksHYdPrMx7sTX56LwaqnpHInoW9OlYn7I
	Q2iT5R4CGev1wMktT56QLd1E+T7e8Sfu/kU/XfqKusBDDuvFLevn9YMHQRG4qpt6KGFQGqj6MgC
	bmwXUDOErKl3UALJ3dkpW9QdbZGFM8P5eA/QIH1IdyHUe9qb7EWgkrtH/fT3ar8YgsJxm23dYrn
	a+uhtRktYdE/fTZJf72ljiy5qoyYj32x4cej/OBVEcZULSksmmtwNshgb4PAcf+/ZsJICsNq0p1
	22YEvPFk/4QbsoDKtc8qHTQDptMGBILdrs1w3QMjhEEwAg==
X-Google-Smtp-Source: AGHT+IG7rSSjfegV5q8spfsx5GQsR+z24DaVkeLHuOfA6MeCjT4uCSP7m5n89u2kYrb7q6AodLQT3LCzQnL3TEQHMBs=
X-Received: by 2002:a05:6402:2787:b0:63b:efa7:b0a9 with SMTP id
 4fb4d7f45d1cf-63c1f633e3dmr22375791a12.9.1761170374240; Wed, 22 Oct 2025
 14:59:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022032817.320378-1-patrick.oppenlander@gmail.com> <7acb046d-5c16-46c1-a034-a128f66e6502@oss.qualcomm.com>
In-Reply-To: <7acb046d-5c16-46c1-a034-a128f66e6502@oss.qualcomm.com>
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Thu, 23 Oct 2025 08:59:22 +1100
X-Gm-Features: AS18NWBrmaHgFWMnD7vXLEBvWHIqZrKdZwVDq1a0VXoCSqqNwalH_BweendZ89c
Message-ID: <CAEg67GkKoM6L6Cz63SY_7nd_XdTMC6wTCWj5W5yR43oNf4AsOg@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: EPOLLOUT support
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org, 
	andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 00:35, Zhongqiu Han
<zhongqiu.han@oss.qualcomm.com> wrote:
>
> On 10/22/2025 11:28 AM, patrick.oppenlander@gmail.com wrote:
> > From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> >
> > Previously, polling an rpmsg endpoint (e.g. /dev/ttyRPMSGx) would
> > generate EPOLLIN events but no EPOLLOUT events.
> >
> > Unfortunately, poll support means that we can no longer disable
> > tx-complete interrupts as there is no way to know whether a poller is
> > waiting in sendq, so we always need notifications.
> >
> > Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> > ---
> >   drivers/rpmsg/virtio_rpmsg_bus.c | 101 ++++++++++---------------------
> >   1 file changed, 32 insertions(+), 69 deletions(-)
> >
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 484890b4a6a74..79d983055b4d6 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -41,13 +41,12 @@
> >    * @buf_size:   size of one rx or tx buffer
> >    * @last_sbuf:      index of last tx buffer used
> >    * @bufs_dma:       dma base addr of the buffers
> > - * @tx_lock: protects svq, sbufs and sleepers, to allow concurrent senders.
> > + * @tx_lock: protects svq and sbufs, to allow concurrent senders.
> >    *          sending a message might require waking up a dozing remote
> >    *          processor, which involves sleeping, hence the mutex.
> >    * @endpoints:      idr of local endpoints, allows fast retrieval
> >    * @endpoints_lock: lock of the endpoints set
> >    * @sendq:  wait queue of sending contexts waiting for a tx buffers
> > - * @sleepers:        number of senders that are waiting for a tx buffer
> >    *
> >    * This structure stores the rpmsg state of a given virtio remote processor
> >    * device (there might be several virtio proc devices for each physical
> > @@ -65,7 +64,6 @@ struct virtproc_info {
> >       struct idr endpoints;
> >       struct mutex endpoints_lock;
> >       wait_queue_head_t sendq;
> > -     atomic_t sleepers;
> >   };
> >
> >   /* The feature bitmap for virtio rpmsg */
> > @@ -144,6 +142,8 @@ static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
> >   static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
> >   static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
> >                                 int len, u32 dst);
> > +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> > +                               poll_table *wait);
> >   static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
> >   static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
> >                                                  struct rpmsg_channel_info *chinfo);
> > @@ -154,6 +154,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
> >       .sendto = virtio_rpmsg_sendto,
> >       .trysend = virtio_rpmsg_trysend,
> >       .trysendto = virtio_rpmsg_trysendto,
> > +     .poll = virtio_rpmsg_poll,
> >       .get_mtu = virtio_rpmsg_get_mtu,
> >   };
> >
> > @@ -436,7 +437,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> >       unsigned int len;
> >       void *ret;
> >
> > -     /* support multiple concurrent senders */
> >       mutex_lock(&vrp->tx_lock);
> >
> >       /*
> > @@ -454,62 +454,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> >       return ret;
> >   }
> >
> > -/**
> > - * rpmsg_upref_sleepers() - enable "tx-complete" interrupts, if needed
> > - * @vrp: virtual remote processor state
> > - *
> > - * This function is called before a sender is blocked, waiting for
> > - * a tx buffer to become available.
> > - *
> > - * If we already have blocking senders, this function merely increases
> > - * the "sleepers" reference count, and exits.
> > - *
> > - * Otherwise, if this is the first sender to block, we also enable
> > - * virtio's tx callbacks, so we'd be immediately notified when a tx
> > - * buffer is consumed (we rely on virtio's tx callback in order
> > - * to wake up sleeping senders as soon as a tx buffer is used by the
> > - * remote processor).
> > - */
> > -static void rpmsg_upref_sleepers(struct virtproc_info *vrp)
> > -{
> > -     /* support multiple concurrent senders */
> > -     mutex_lock(&vrp->tx_lock);
> > -
> > -     /* are we the first sleeping context waiting for tx buffers ? */
> > -     if (atomic_inc_return(&vrp->sleepers) == 1)
> > -             /* enable "tx-complete" interrupts before dozing off */
> > -             virtqueue_enable_cb(vrp->svq);
> > -
> > -     mutex_unlock(&vrp->tx_lock);
> > -}
> > -
> > -/**
> > - * rpmsg_downref_sleepers() - disable "tx-complete" interrupts, if needed
> > - * @vrp: virtual remote processor state
> > - *
> > - * This function is called after a sender, that waited for a tx buffer
> > - * to become available, is unblocked.
> > - *
> > - * If we still have blocking senders, this function merely decreases
> > - * the "sleepers" reference count, and exits.
> > - *
> > - * Otherwise, if there are no more blocking senders, we also disable
> > - * virtio's tx callbacks, to avoid the overhead incurred with handling
> > - * those (now redundant) interrupts.
> > - */
> > -static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
> > -{
> > -     /* support multiple concurrent senders */
> > -     mutex_lock(&vrp->tx_lock);
> > -
> > -     /* are we the last sleeping context waiting for tx buffers ? */
> > -     if (atomic_dec_and_test(&vrp->sleepers))
> > -             /* disable "tx-complete" interrupts */
> > -             virtqueue_disable_cb(vrp->svq);
> > -
> > -     mutex_unlock(&vrp->tx_lock);
> > -}
> > -
>
> Hi Patrick,
>
> I'd like to go over a few aspects of this patch, please feel free to
> correct me if there is any misunderstanding.

Hi, thanks for the review, I'll address your comments below.

> >   /**
> >    * rpmsg_send_offchannel_raw() - send a message across to the remote processor
> >    * @rpdev: the rpmsg channel
> > @@ -582,9 +526,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> >
> >       /* no free buffer ? wait for one (but bail after 15 seconds) */
> >       while (!msg) {
> > -             /* enable "tx-complete" interrupts, if not already enabled */
> > -             rpmsg_upref_sleepers(vrp);
> > -
> >               /*
> >                * sleep until a free buffer is available or 15 secs elapse.
> >                * the timeout period is not configurable because there's
> > @@ -595,9 +536,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> >                                       (msg = get_a_tx_buf(vrp)),
> >                                       msecs_to_jiffies(15000));
> >
> > -             /* disable "tx-complete" interrupts if we're the last sleeper */
> > -             rpmsg_downref_sleepers(vrp);
>
> 1.The original code dynamically disabled tx-complete interrupts during
> normal operation and only enabled them when waiting for buffers. This
> patch removes all virtqueue_disable_cb() calls, meaning interrupts are
> always enabled. For high-frequency messaging, could this significantly
> increase interrupt overhead, even irq storm? May I know do you have
> performance data showing the interrupt frequency increase?

I mentioned this in the commit message.

The problem is that the poller can be removed at any time by
poll_freewait, and there is no notification of this happening. The
simplest solution to this is what I have proposed in this patch, i.e.
always leave callbacks enabled.

There is an alternate solution, but it comes with a possibly
significant caveat. We could add a check along the lines of:

if wq_has_sleeper(vrp->sendq) {
        virtqueue_disable_cb(vrp->svq);
}

But this is not guaranteed to work as expected as poll_freewait can
remove the poller at any time (i.e. after we've performed this check),
meaning that the callbacks will sometimes remain enabled regardless.

In terms of performance, I have not measured a difference in my workload.

> > -
> >               /* timeout ? */
> >               if (!err) {
> >                       dev_err(dev, "timeout waiting for a tx buffer\n");
> > @@ -676,6 +614,34 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
> >       return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
> >   }
> >
> > +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> > +                               poll_table *wait)
> > +{
> > +     struct rpmsg_device *rpdev = ept->rpdev;
> > +     struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> > +     struct virtproc_info *vrp = vch->vrp;
> > +     __poll_t mask = 0;
> > +
> > +     poll_wait(filp, &vrp->sendq, wait);
> > +
> > +     /* support multiple concurrent senders */
> > +     mutex_lock(&vrp->tx_lock);
> > +
> > +     /*
> > +      * check for a free buffer, either:
> > +      * - we haven't used all of the available transmit buffers (half of the
> > +      *   allocated buffers are used for transmit, hence num_bufs / 2), or,
> > +      * - we ask the virtqueue if there's a buffer available
> > +      */
> > +     if (vrp->last_sbuf < vrp->num_bufs / 2 ||
> > +         !virtqueue_enable_cb(vrp->svq))
> > +             mask |= EPOLLOUT;
> > +
>
> 2.The virtio_rpmsg_poll() calls virtqueue_enable_cb() but seems never
> disables it. Once any process polls the device, interrupts remain
> permanently enabled even after poll completes?

virtio_rpmsg_poll returns immediately after registering the poller and
checking whether there are any free buffers. poll_wait does not block,
so there's no way to know that poll has completed.

With this change callbacks are always enabled (they're enabled by the
virtqueue initialisation if a callback is registered). Calling
virtqueue_enable_cb here doesn't actually enable callbacks. We call it
because its return value tells us whether there's any pending buffers
in the queue. I'm not aware of another virtqueue API which can perform
this check.

We could propose a new virtqueue_buf_pending() or something along
those lines if necessary, but, looking at the implementation of
virtqueue_enable_cb(), we'd effectively be causing a bunch of code
churn to avoid a couple of if tests. Given that we'd be the only
consumer of this new API it didn't seem worth it to me?

Kind regards,

Patrick

> > +     mutex_unlock(&vrp->tx_lock);
> > +
> > +     return mask;
> > +}
> > +
> >   static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> >   {
> >       struct rpmsg_device *rpdev = ept->rpdev;
> > @@ -922,9 +888,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >               WARN_ON(err); /* sanity check; this can't really happen */
> >       }
> >
> > -     /* suppress "tx-complete" interrupts */
> > -     virtqueue_disable_cb(vrp->svq);
> > -
> >       vdev->priv = vrp;
> >
> >       rpdev_ctrl = rpmsg_virtio_add_ctrl_dev(vdev);
>
>
> --
> Thx and BRs,
> Zhongqiu Han

