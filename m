Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4224F21DFAC
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Jul 2020 20:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgGMSaJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 13 Jul 2020 14:30:09 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37160 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726058AbgGMSaJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Jul 2020 14:30:09 -0400
Received: by mail-io1-f68.google.com with SMTP id v6so14573669iob.4;
        Mon, 13 Jul 2020 11:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rIQlsjDi0tvpb6bzNA737NPfAI6p63hzRYQiaEuCUvM=;
        b=l4T1d77+qA3HyAViAmmjuWTfdFR2gBkYJaVYH1NOUFWjLgtWJlR6LSldhAcNzHPGQm
         3J61mW6lfuzhAK4USwNfhAntXwL+v6LiffKSstiSHpnIAYz2k1AfN2Niwpxi7FUrfzjt
         BAo0AlSz8NpDL3QzSMmIu7mGM31Hxmw1RP/+wU64HoWIc4e3jemP7PTEA/9H2uJiNIDv
         ioiEhtHLbC2ucOsTB9ToiZdnuEZV42959J/rdvVZj+/SrNQtcdEmxJjRD6ET75b1jCEN
         Vx5fzjYsdoAN1KFaefwnc0OEO41E9yM4SStXbVlb9hk3EW9gpcpjOi6JYIVKNBGtu7xh
         feFA==
X-Gm-Message-State: AOAM531bqIqXXBMtJ4F8msMyTJnfEe+n1nFsn/uD1pqzPc7mE504CI5w
        wNL4VfhFtahtGFx0TjcLcQ==
X-Google-Smtp-Source: ABdhPJx7yiGPcydh9XG53doGG+7bNapG6fmV6HSGHoyOxCtPoO+8YUWYYYzMTLE7zJ9GO2VDiEmVTw==
X-Received: by 2002:a02:c903:: with SMTP id t3mr1593875jao.30.1594665008503;
        Mon, 13 Jul 2020 11:30:08 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id i188sm7963259ioa.33.2020.07.13.11.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:30:07 -0700 (PDT)
Received: (nullmailer pid 502044 invoked by uid 1000);
        Mon, 13 Jul 2020 18:30:07 -0000
Date:   Mon, 13 Jul 2020 12:30:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: remoteproc: Add common TI SCI rproc
 bindings
Message-ID: <20200713183007.GA501995@bogus>
References: <20200612224914.7634-1-s-anna@ti.com>
 <20200612224914.7634-4-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612224914.7634-4-s-anna@ti.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 12 Jun 2020 17:49:11 -0500, Suman Anna wrote:
> Add a bindings document that lists the common TI SCI properties
> used by the K3 R5F and DSP remoteproc devices.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v3: New Patch refactoring out the common ti-sci-proc properties
> 
>  .../bindings/remoteproc/ti,k3-sci-proc.yaml   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-sci-proc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
