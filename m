Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34A0B7CA929
	for <lists+linux-remoteproc@lfdr.de>; Mon, 16 Oct 2023 15:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbjJPNQ5 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 16 Oct 2023 09:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233326AbjJPNQ4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Oct 2023 09:16:56 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FCEFC
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Oct 2023 06:16:53 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53e855d7dacso2905109a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Oct 2023 06:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697462211; x=1698067011; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5pF3ZPZEJfxdS2FlRC7PR1IY9uBSbrt/ops9UBd2HfE=;
        b=hXP2m7zB+eZV9J2vjpZJifdy11Th60shY8dj0WYzMGrGQoy7msSk4KBwCftXdkXJ1i
         RWXepVusPjHblJ1gcfovDNMp7bFpPqPQuOS6eSHDsg8q0mxiH7NV784Lin+wPSlHqtIF
         KJc+W+wweKM/sPOaJTggiwkVE0S8qIpSuhKrhMsSgbzXEQXGgQpDYm8tKFlaqhE4Cvd9
         7IZloz2s/dA0BPEHUrmAIggGzqlHwftVQ/mWThqfIlB1+kS/5gt+GzD4+IAmw8FLvs+i
         M9M62f8w9T4+2BpnEsuFkB1DvYvDbJk3hHVjq3RzSfAVC7pu97HBPH+8RQ/T8RruiORu
         QLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697462211; x=1698067011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pF3ZPZEJfxdS2FlRC7PR1IY9uBSbrt/ops9UBd2HfE=;
        b=LpsqqOAMgjIKhBLU0yNwRCKXoJ4l4qnXjEWFr6vX8pyr6rAv6WgBL4wol8V/uX/scg
         aRFJt6jCj4tYwbbqpWb4IVgKt4O1crJQZ6FpqJGcxaWMs13ONyMqo2sWA1Zr3TWFN3V0
         7BBNYnzSD9q2bqUGVm6a/VJqI2nkQHH384XaLpYcPUGou1FRsPzUUw8BhdAb089Wy5UB
         2oab/VnrPOF8Mh1LyIf2Y7rwuTnjOhO29+AMVExa340E4eEv1SmCWjjqR7jwEaPtuIDj
         qtXKI9WzG5mK8k1Bxp0GCwFDCDAcUSc8KTIJduHdxIRZEeTJa9mT954TLupZVgJQx14r
         maOQ==
X-Gm-Message-State: AOJu0YxSYF+Hs92fu2wF5CFek8oCrDUELuo5MdrzJr6YjldnV+mEw5is
        4AWQ8762CmFhQPD8b3w45hRnnX0NDlBaxO+yhUwZ0w==
X-Google-Smtp-Source: AGHT+IETt7yzLHkEuRMnCxA43jlgZJZykbSAwlI5IGIsB+5JMf71DfTWev/OHil7N3vTUxjnSk6fw080fjWFprpfg98=
X-Received: by 2002:a05:6402:3548:b0:53e:468c:8c49 with SMTP id
 f8-20020a056402354800b0053e468c8c49mr8269572edd.35.1697462211419; Mon, 16 Oct
 2023 06:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231015-fp3-wcnss-v1-0-1b311335e931@z3ntu.xyz>
 <20231015-fp3-wcnss-v1-1-1b311335e931@z3ntu.xyz> <ffca099a-bf05-4973-885d-b049a45d466f@linaro.org>
In-Reply-To: <ffca099a-bf05-4973-885d-b049a45d466f@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 16 Oct 2023 15:16:14 +0200
Message-ID: <CAMZdPi-S2_UQO-rD38-thwta-YgH3W78Ecd1Du7Q_US=J7k0ew@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: qcom: wcnss: Add WCN3680B compatible
To:     Luca Weiss <luca@z3ntu.xyz>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kalle Valo <kvalo@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 16 Oct 2023 at 07:35, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/10/2023 22:03, Luca Weiss wrote:
> > Add a compatible for the iris subnode in the WCNSS PIL.
> >
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> >  Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> > index 45eb42bd3c2c..0e5e0b7a0610 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> > @@ -111,6 +111,7 @@ properties:
> >            - qcom,wcn3660
> >            - qcom,wcn3660b
> >            - qcom,wcn3680
> > +          - qcom,wcn3680b
>
> Looks like this should be made as compatible with qcom,wcn3680 (so with
> fallback).

Yes, agree, let's do a regular fallback as there is nothing 'b'
specific in the driver:
`compatible = "qcom,wcn3680b", "qcom,wcn3680";`

And yes, we should also have done that for qcom,wcn3660b...

Regards,
Loic
