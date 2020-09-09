Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2487726373B
	for <lists+linux-remoteproc@lfdr.de>; Wed,  9 Sep 2020 22:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgIIUXD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 9 Sep 2020 16:23:03 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:42951 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbgIIUXC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Sep 2020 16:23:02 -0400
Received: by mail-il1-f195.google.com with SMTP id t13so3578823ile.9;
        Wed, 09 Sep 2020 13:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p/XHmGhJiyARP/AywHLjGyFW+zNdKo78DZXJUs497vk=;
        b=ZX+TvnhYF3bNbwGePW0r5LI+JdBTEnlcxKNGBykNK9hxONtbx0c+X2nOOT8cX5x1Y7
         jJyB5zLK6s3n8TrKsQVpd1rDRIVzbn1f6jUMyyML9eXqVs2ew1wrh5AkEFYVM5QxKHJ9
         9kvphNpHIR+TNHHpEtkkwFVarc7/915djha9xBduhEer9IwtA7afT/+sA0K9tyL9oXK2
         NQPx6lOnCKb3DDOdJYGofFlKKUWjCNxHe5gfwyzmeaNAq9B4a6dt2EsXiLVgXIRY/bgt
         OCH+/D9BEAjMt5aY26mPAkVmkyKPzCP5xLLn4/8Ctd5fSBCi9cq2ZB0mrRJ6DYwFohfr
         g0Zg==
X-Gm-Message-State: AOAM5333xli8KNdRUTufXlAxqXZDQXwPz0YQVjPu+AHjokAQYfe72AdK
        DDVc5jaX/4//O4jdpYrMmg==
X-Google-Smtp-Source: ABdhPJwGgJMfrg41VCSlFUyxeF4VEeQtHEzW/mNeG0zBjw9Qla8f2sLKD3BFKup9Yno/CdJR1OlO5Q==
X-Received: by 2002:a92:bad9:: with SMTP id t86mr4991746ill.308.1599682981597;
        Wed, 09 Sep 2020 13:23:01 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id f83sm2024294ilg.9.2020.09.09.13.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 13:23:00 -0700 (PDT)
Received: (nullmailer pid 3008103 invoked by uid 1000);
        Wed, 09 Sep 2020 20:22:51 -0000
Date:   Wed, 9 Sep 2020 14:22:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: remoteproc: stm32_rproc: update for
 firmware synchronization
Message-ID: <20200909202251.GA2975092@bogus>
References: <20200827072101.26588-1-arnaud.pouliquen@st.com>
 <20200827072101.26588-3-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827072101.26588-3-arnaud.pouliquen@st.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Aug 27, 2020 at 09:21:00AM +0200, Arnaud Pouliquen wrote:
> Add new properties description used to attach to a pre-loaded
> firmware according to the commit 9276536f455b3
> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation")
> which updates the driver part.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index 4ffa25268fcc..e50957d86b1c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -96,6 +96,25 @@ properties:
>          3rd cell: register bitmask for the deep sleep bit
>      maxItems: 1
>  
> +  st,syscfg-m4-state:
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    description: |
> +      Reference to the tamp register which exposes the Cortex-M4 state.
> +        1st cell: phandle to syscon block
> +        2nd cell: register offset containing the Cortex-M4 state
> +        3rd cell: register bitmask for the Cortex-M4 state
> +    maxItems: 1
> +
> +  st,syscfg-rsc-tbl:
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    description: |
> +      Reference to the tamp register which references the Cortex-M4
> +      resource table address.
> +        1st cell: phandle to syscon block
> +        2nd cell: register offset containing the resource table address
> +        3rd cell: register bitmask for the resource table address
> +    maxItems: 1

Why can't these be implied? You can lookup the tamp syscon by 
compatible.

Please add these to the example.

> +
>    st,auto-boot:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> -- 
> 2.17.1
> 
