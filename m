Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD41C21DFB2
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Jul 2020 20:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgGMSbQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 13 Jul 2020 14:31:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:53544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726058AbgGMSbP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Jul 2020 14:31:15 -0400
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2D6A62075D;
        Mon, 13 Jul 2020 18:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594665075;
        bh=Q+HK1Q7zVRO6bPfXYi5jwqYnO9t8ua0qhLDmv/SMT90=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Diq5Pb/QksKWa4fHMqMPg9ZyVIdPDDMzIycugVPMsSAg9QyZjauVpT4K/Z+wiJMKD
         LenahMasZS38qRigWgWHRym685l3wZBBZQ6asMjH99kNRvLsLNIxCxtXN+sHWsY9Vz
         /0Q4u6CGlAisL7ZGmWWFUhkHzdmjwztkRfTS49OY=
Received: by mail-oi1-f178.google.com with SMTP id k6so11759179oij.11;
        Mon, 13 Jul 2020 11:31:15 -0700 (PDT)
X-Gm-Message-State: AOAM531tJ9zJY+pSaSahWliUQD3P8svxU5Zmp6znrYi2mg5G+XIouAJz
        CKClKZDSeOM9Qtu5HJui/biDKUOjwzNanSc3RQ==
X-Google-Smtp-Source: ABdhPJwD3DPdHbzTuxLSVpY1ZFpk34ZdgtVY1onVvRra1UjjLWAFSnTbuXzcHV7Q3WMvOKzCnlYkge/bnGcwgolP8W4=
X-Received: by 2002:aca:4844:: with SMTP id v65mr677170oia.152.1594665074595;
 Mon, 13 Jul 2020 11:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200612224914.7634-1-s-anna@ti.com> <20200612224914.7634-4-s-anna@ti.com>
 <20200713183007.GA501995@bogus>
In-Reply-To: <20200713183007.GA501995@bogus>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 13 Jul 2020 12:31:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLN8sb+FS3Sh5YmHLvF=Mm_DngNPKv1Sb8pwcAwOnd1Fw@mail.gmail.com>
Message-ID: <CAL_JsqLN8sb+FS3Sh5YmHLvF=Mm_DngNPKv1Sb8pwcAwOnd1Fw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: remoteproc: Add common TI SCI rproc bindings
To:     Suman Anna <s-anna@ti.com>
Cc:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jul 13, 2020 at 12:30 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 12 Jun 2020 17:49:11 -0500, Suman Anna wrote:
> > Add a bindings document that lists the common TI SCI properties
> > used by the K3 R5F and DSP remoteproc devices.
> >
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > ---
> > v3: New Patch refactoring out the common ti-sci-proc properties
> >
> >  .../bindings/remoteproc/ti,k3-sci-proc.yaml   | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-sci-proc.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Oops, wrong patch.
